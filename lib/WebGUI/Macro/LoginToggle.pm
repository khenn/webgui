package WebGUI::Macro::LoginToggle;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2002 Plain Black LLC.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com info@plainblack.com
#-------------------------------------------------------------------

use strict;
use WebGUI::International;
use WebGUI::Macro;
use WebGUI::Session;
use WebGUI::URL;

#-------------------------------------------------------------------
sub _replacement {
       my (@param, $temp, $login, $logout);
       @param = WebGUI::Macro::getParams($_[0]);
       if ($session{user}{userId} == 1) {
               $login = $param[0] || WebGUI::International::get(716);
               $temp = '<a class="loginToggleLink" href="'.WebGUI::URL::page('op=displayLogin').'">'.$login.'</a>';
       } else {
               $logout = $param[1] || WebGUI::International::get(717);
               $temp = '<a class="loginToggleLink" href="'.WebGUI::URL::page('op=logout').'">'.$logout.'</a>';
       }
       return $temp;
}

#-------------------------------------------------------------------
sub process {
       my ($output, $temp);
       $output = $_[0];
       $output =~ s/\^LoginToggle\((.*?)\)\;/_replacement($1)/ge;
       $output =~ s/\^LoginToggle\;/_replacement()/ge;
       return $output;
}

1;

