#!/usr/bin/env perl

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2009 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

our ($webguiRoot);

BEGIN {
    $webguiRoot = "../..";
    unshift (@INC, $webguiRoot."/lib");
}

use strict;
use Getopt::Long;
use WebGUI::Session;
use WebGUI::Storage;
use WebGUI::Asset;
use WebGUI::Asset::Wobject::Collaboration;
use WebGUI::Asset::Post::Thread;
use WebGUI::ProfileField;

my $toVersion = '7.9.8';
my $quiet; # this line required

my $session = start(); # this line required

# upgrade functions go here
changeFirstDayOfWeekDefault($session);
updateLastPostCS($session);
updateLastPostThread($session);
addTwitterAuth( $session );

finish($session); # this line required


#----------------------------------------------------------------------------
# Describe what our function does
#sub exampleFunction {
#    my $session = shift;
#    print "\tWe're doing some stuff here that you should know about... " unless $quiet;
#    # and here's our code
#    print "DONE!\n" unless $quiet;
#}

#----------------------------------------------------------------------------
# Add twitter auth and macro
sub addTwitterAuth {
    my $session = shift;
    print "\tAdding twitter auth method... " unless $quiet;

    $session->config->addToArray( 'authMethods', 'Twitter' );
    $session->config->addToHash( 'macros', "TwitterLogin" => "TwitterLogin" );
    $session->setting->set( 'twitterEnabled', 0 );
    $session->setting->set( 'twitterTemplateIdChooseUsername', 'mfHGkp6t9gdclmzN33OEnw' );

    print "DONE!\n" unless $quiet;
}

#----------------------------------------------------------------------------
# Describe what our function does
sub changeFirstDayOfWeekDefault {
    my $session = shift;
    print "\tMake the default for firstDayOfWeek a number instead of a string... " unless $quiet;
    # and here's our code
    my $profileField = WebGUI::ProfileField->new($session, 'firstDayOfWeek');
    my $properties = $profileField->get();
    $properties->{dataDefault} = 0;
    $profileField->set($properties);
    print "DONE!\n" unless $quiet;
}

#----------------------------------------------------------------------------
# Describe what our function does
sub updateLastPostCS {
    my $session = shift;
    print "\tUpdating last post information in every Collaboration System.  This could take a very long time... " unless $quiet;
    # and here's our code
    my $getCs = WebGUI::Asset::Wobject::Collaboration->getIsa($session);
    CS: while (my $cs = eval { $getCs->() } ) {
       next CS if Exception::Class->caught();
       last CS if ! $cs;
       next CS unless $cs->get('lastPostId');
       my $lastPost = WebGUI::Asset->newByDynamicClass($session, $cs->get('lastPostId'));
       next CS unless $lastPost && $lastPost->get('status') eq 'archived';
       $lastPost->disqualifyAsLastPost;
   }
    print "DONE!\n" unless $quiet;
}

#----------------------------------------------------------------------------
# Describe what our function does
sub updateLastPostThread {
    my $session = shift;
    print "\tUpdating last post information in every Thread.  This could also take a very long time... " unless $quiet;
    # and here's our code
    my $getThread = WebGUI::Asset::Wobject::Collaboration->getIsa($session);
    THREAD: while (my $thread = eval { $getThread->() } ) {
       next THREAD if Exception::Class->caught();
       last THREAD if ! $thread;
       next THREAD unless $thread->get('lastPostId');
       my $lastPost = WebGUI::Asset->newByDynamicClass($session, $thread->get('lastPostId'));
       next THREAD unless $lastPost && $lastPost->get('status') eq 'archived';
       $lastPost->disqualifyAsLastPost;
   }
    print "DONE!\n" unless $quiet;
}

# -------------- DO NOT EDIT BELOW THIS LINE --------------------------------

#----------------------------------------------------------------------------
# Add a package to the import node
sub addPackage {
    my $session     = shift;
    my $file        = shift;

    print "\tUpgrading package $file\n" unless $quiet;
    # Make a storage location for the package
    my $storage     = WebGUI::Storage->createTemp( $session );
    $storage->addFileFromFilesystem( $file );

    # Import the package into the import node
    my $package = eval {
        my $node = WebGUI::Asset->getImportNode($session);
        $node->importPackage( $storage, {
            overwriteLatest    => 1,
            clearPackageFlag   => 1,
            setDefaultTemplate => 1,
        } );
    };

    if ($package eq 'corrupt') {
        die "Corrupt package found in $file.  Stopping upgrade.\n";
    }
    if ($@ || !defined $package) {
        die "Error during package import on $file: $@\nStopping upgrade\n.";
    }

    return;
}

#-------------------------------------------------
sub start {
    my $configFile;
    $|=1; #disable output buffering
    GetOptions(
        'configFile=s'=>\$configFile,
        'quiet'=>\$quiet
    );
    my $session = WebGUI::Session->open($webguiRoot,$configFile);
    $session->user({userId=>3});
    my $versionTag = WebGUI::VersionTag->getWorking($session);
    $versionTag->set({name=>"Upgrade to ".$toVersion});
    return $session;
}

#-------------------------------------------------
sub finish {
    my $session = shift;
    updateTemplates($session);
    my $versionTag = WebGUI::VersionTag->getWorking($session);
    $versionTag->commit;
    $session->db->write("insert into webguiVersion values (".$session->db->quote($toVersion).",'upgrade',".time().")");
    $session->close();
}

#-------------------------------------------------
sub updateTemplates {
    my $session = shift;
    return undef unless (-d "packages-".$toVersion);
    print "\tUpdating packages.\n" unless ($quiet);
    opendir(DIR,"packages-".$toVersion);
    my @files = readdir(DIR);
    closedir(DIR);
    my $newFolder = undef;
    foreach my $file (@files) {
        next unless ($file =~ /\.wgpkg$/);
        # Fix the filename to include a path
        $file       = "packages-" . $toVersion . "/" . $file;
        addPackage( $session, $file );
    }
}

#vim:ft=perl
