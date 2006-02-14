#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2006 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use FindBin;
use strict;
use lib "$FindBin::Bin/lib";

use WebGUI::Test;
use WebGUI::Session;
use WebGUI::Utility;

use WebGUI::User;
use Test::More tests => 60; # increment this value for each test you create

my $session = WebGUI::Test->session;

my $user;
my $lastUpdate;

#Let's try to create a new user and make sure we get an object back
my $userCreationTime = time();
ok(defined ($user = WebGUI::User->new($session,"new")), 'new("new") -- object reference is defined');

#New does not return undef if something breaks, so we'll see if the _profile hash was set.
ok(scalar %{$user->{_profile}} > 0, 'new("new") -- profile property contains at least one key');  

#Let's assign a username
$lastUpdate = time();
$user->username("bill_lumberg");
is($user->username, "bill_lumberg", 'username() method');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- username change');

#Let's check the UID and make sure it's sane
ok($user->userId =~ m/[A-Za-z0-9\-\_]{22}/, 'userId() returns sane value');

#Let's check the status method
$lastUpdate = time();
$user->status('Active');
is($user->status, "Active", 'status("Active")');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- status change');

$user->status('Selfdestructed');
is($user->status, "Selfdestructed", 'status("Selfdestructed")');

$user->status('Deactivated');
is($user->status, "Deactivated", 'status("Deactivated")');

#Let's get/set a profile field
$lastUpdate = time();
$user->profileField("firstName", "Bill");
is($user->profileField("firstName"), "Bill", 'profileField() get/set');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- profileField');

#Let's check the auth methods

#Default should be WebGUI
is($user->authMethod, "WebGUI", 'authMethod() -- default value is WebGUI');

#Try changing to LDAP
$lastUpdate = time();
$user->authMethod("LDAP");
is($user->authMethod, "LDAP", 'authMethod() -- set to LDAP');
$user->authMethod("WebGUI");
is($user->authMethod, "WebGUI", 'authMethod() -- set back to WebGUI');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- authmethod change');

#See if datecreated is correct
is($user->dateCreated, $userCreationTime, 'dateCreated()');

#get/set karma
my $oldKarma = $user->karma;
$user->karma('69', 'peter gibbons', 'test karma');
is($user->karma, $oldKarma+69, 'karma() -- get/set add amount');

my ($source, $description) = $session->db->quickArray("select source, description from karmaLog where userId=".$session->db->quote($user->userId));

is($source, 'peter gibbons', 'karma() -- get/set source');
is($description, 'test karma', 'karma() -- get/set description');

$oldKarma = $user->karma;
$user->karma('-69', 'peter gibbons', 'lumberg took test karma away');
is($user->karma, $oldKarma-69, 'karma() -- get/set subtract amount');

#Let's test referringAffiliate
$lastUpdate = time();
$user->referringAffiliate(10);
is($user->referringAffiliate, '10', 'referringAffiliate() -- get/set');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- referringAffiliate');

#Let's try adding this user to some groups
my @groups = qw|2 4|;
$user->addToGroups(\@groups);

my ($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('2')." and userId=".$session->db->quote($user->userId));
ok($result, 'addToGroups() -- added to first test group');

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('4')." and userId=".$session->db->quote($user->userId));
ok($result, 'addToGroups() -- added to second test group');

#Let's delete this user from our test groups
$user->deleteFromGroups(\@groups);

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('2')." and userId=".$session->db->quote($user->userId));
is($result, '0', 'deleteFromGroups() -- removed from first test group');

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('4')." and userId=".$session->db->quote($user->userId));
is($result, '0', 'deleteFromGroups() -- removed from second test group');

#Let's delete this user
my $userId = $user->userId;
$user->delete;

my ($count) = $session->db->quickArray("select count(*) from users where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- users table');

($count) = $session->db->quickArray("select count(*) from userProfileData where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- userProfileData table');

($count) = $session->db->quickArray("select count(*) from messageLog where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- messageLog table'); 

#Let's test new with an override uid
$user = WebGUI::User->new($session, "new", "ROYSUNIQUEUSERID000001");
is($user->userId, "ROYSUNIQUEUSERID000001", 'new() -- override user id');
$user->delete;

#Let's test new to retrieve an existing user
$user = WebGUI::User->new($session,3);
is($user->username, "Admin", 'new() -- retrieve existing user');
$user = "";

#Let's test new to retrieve default user visitor with no params passed in
$user = WebGUI::User->new($session);
is($user->userId, '1', 'new() -- returns visitor with no args');
$user = "";

$user = WebGUI::User->new($session, "new", "ROYSUNIQUEUSERID000002");
is($user->userId, "ROYSUNIQUEUSERID000002", 'new() -- override user id');
$user->authMethod("LDAP");
is($user->authMethod, "LDAP", 'authMethod() -- set to LDAP');

#get/set karma
my $oldKarma = $user->karma;
$user->karma('69', 'peter gibbons', 'test karma');
is($user->karma, $oldKarma+69, 'karma() -- get/set add amount');

my ($source, $description) = $session->db->quickArray("select source, description from karmaLog where userId=".$session->db->quote($user->userId));

is($source, 'peter gibbons', 'karma() -- get/set source');
is($description, 'test karma', 'karma() -- get/set description');

$oldKarma = $user->karma;
$user->karma('-69', 'peter gibbons', 'lumberg took test karma away');
is($user->karma, $oldKarma-69, 'karma() -- get/set subtract amount');

#Let's test referringAffiliate
$lastUpdate = time();
$user->referringAffiliate(10);
is($user->referringAffiliate, '10', 'referringAffiliate() -- get/set');
is($user->lastUpdated, $lastUpdate, 'lastUpdated() -- referringAffiliate');

#Let's try adding this user to some groups
my @groups = qw|2 4|;
$user->addToGroups(\@groups);

my ($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('2')." and userId=".$session->db->quote($user->userId));
ok($result, 'addToGroups() -- added to first test group');

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('4')." and userId=".$session->db->quote($user->userId));
ok($result, 'addToGroups() -- added to second test group');

#Let's delete this user from our test groups
$user->deleteFromGroups(\@groups);

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('2')." and userId=".$session->db->quote($user->userId));
is($result, '0', 'deleteFromGroups() -- removed from first test group');

($result) = $session->db->quickArray("select count(*) from groupings where groupId=".$session->db->quote('4')." and userId=".$session->db->quote($user->userId));
is($result, '0', 'deleteFromGroups() -- removed from second test group');

#Let's delete this user
my $userId = $user->userId;
$user->delete;

my ($count) = $session->db->quickArray("select count(*) from users where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- users table');

($count) = $session->db->quickArray("select count(*) from userProfileData where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- userProfileData table');

($count) = $session->db->quickArray("select count(*) from messageLog where userId=".$session->db->quote($userId));
is($count, '0', 'delete() -- messageLog table'); 


ok(WebGUI::User->validUserId($session, 1), 'Visitor has a valid userId');
ok(WebGUI::User->validUserId($session, 3), 'Admin has a valid userId');
ok(!WebGUI::User->validUserId($session, 'eeee'), 'random illegal Id #1');
ok(!WebGUI::User->validUserId($session, 37), 'random illegal Id #2');

#identifier() and uncache()
SKIP: {
  skip("identifier() -- deprecated",1);
  ok(undef, "identifier()");
}

SKIP: {
  skip("uncache() -- Don't know how to test uncache()",1);
  ok(undef, "uncache");
}

my $cm = WebGUI::Group->new($session, 4);
is( $cm->name, "Content Managers", "content manager name check");
is( $cm->getId, 4, "content manager groupId check");

my $admin = WebGUI::User->new($session, 3);
my $visitor = WebGUI::User->new($session, 1);

##Manipulate the env object to set up this test
my $env = $session->{_env};
$env->{_env}->{"REMOTE_ADDR"} = '192.168.0.101';

ok (!$visitor->isInGroup($cm->getId), "Visitor is not member of group");
ok ($admin->isInGroup($cm->getId), "Admin is not member of group");

my $origFilter = $cm->ipFilter;

$cm->ipFilter('192.168.0.');

is( $cm->ipFilter, "192.168.0.", "ipFilter assignment to local net, 192.168.0.");

ok ($visitor->isInGroup($cm->getId), "Visitor is allowed in via IP");

$env->{_env}->{"REMOTE_ADDR"} = '193.168.0.101';

ok (!$visitor->isInGroup($cm->getId), "Visitor is not allowed in via IP");

##Restore original filter
$cm->ipFilter($origFilter);
