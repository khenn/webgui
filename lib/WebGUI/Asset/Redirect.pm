package WebGUI::Asset::Redirect;

=head1 LEGAL

 -------------------------------------------------------------------
  WebGUI is Copyright 2001-2006 Plain Black Corporation.
 -------------------------------------------------------------------
  Please read the legal notices (docs/legal.txt) and the license
  (docs/license.txt) that came with this distribution before using
  this software.
 -------------------------------------------------------------------
  http://www.plainblack.com                     info@plainblack.com
 -------------------------------------------------------------------

=cut

use strict;
use WebGUI::Asset;
use WebGUI::Macro;

our @ISA = qw(WebGUI::Asset);


=head1 NAME

Package WebGUI::Asset::Redirect 

=head1 DESCRIPTION

Provides a mechanism to redirect pages from the WebGUI site to external sites.

=head1 SYNOPSIS

use WebGUI::Asset::Redirect;


=head1 METHODS

These methods are available from this class:

=cut



#-------------------------------------------------------------------

=head2 definition ( definition )

Defines the properties of this asset.

=head3 definition

A hash reference passed in from a subclass definition.

=cut

sub definition {
        my $class = shift;
        my $definition = shift;
        push(@{$definition}, {
		assetName=>WebGUI::International::get('assetName',"Asset_Redirect"),
		uiLevel => 9,
		icon=>'redirect.gif',
                tableName=>'redirect',
                className=>'WebGUI::Asset::Redirect',
                properties=>{
                                redirectUrl=>{
                                        fieldType=>'url',
                                        defaultValue=>undef
                                        }
                        }
                });
        return $class->SUPER::definition($definition);
}



#-------------------------------------------------------------------

=head2 getEditForm ()

Returns the TabForm object that will be used in generating the edit page for this asset.

=cut

sub getEditForm {
	my $self = shift;
	my $tabform = $self->SUPER::getEditForm();
        $tabform->getTab("properties")->url(
                -name=>"redirectUrl",
                -label=>WebGUI::International::get('redirect url', 'Asset_Redirect'),
                -hoverHelp=>WebGUI::International::get('redirect url description', 'Asset_Redirect'),
                -value=>$self->getValue("redirectUrl")
                );
	return $tabform;
}


#-------------------------------------------------------------------
sub www_edit {
        my $self = shift;
        return $self->session->privilege->insufficient() unless $self->canEdit;
        $self->getAdminConsole->setHelp("redirect add/edit", "Asset_Redirect");
        return $self->getAdminConsole->render($self->getEditForm->print,WebGUI::International::get('redirect add/edit title', 'Asset_Redirect'));
}

#-------------------------------------------------------------------

=head2 www_view

A web executable method that redirects the user to the specified page, or displays the edit interface when admin mode is enabled.

=cut

sub www_view {
        my $self = shift;
        return $self->session->privilege->noAccess() unless $self->canView;
        if ($self->session->var->isAdminOn() && $self->canEdit) {
                my $i18n = WebGUI::International->new("Asset_Redirect");
                return $self->getAdminConsole->render($i18n->get("what do you want to do with this redirect").'
                        <ul>
                        <li><a href="'.$self->get("redirectUrl").'">'.$i18n->get("go to the redirect url").'</a></li>
                        <li><a href="'.$self->getUrl("func=edit").'">'.$i18n->get("edit the redirect properties").'</a></li>
                        <li><a href="'.$self->getParent->getUrl.'">'.$i18n->get("go to the redirect parent page").'</a></li>
                        </ul>',$i18n->get("assetName"));
        }
        my $url = $self->get("redirectUrl");
        WebGUI::Macro::process(\$url);
        $self->session->http->setRedirect($url) unless $self->get("redirectUrl") eq $self->get("url");
        return "Redirect is self-referential";
}

1;

