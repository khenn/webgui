package WebGUI::Macro;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2002 Plain Black LLC.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use strict qw(vars subs);
use WebGUI::ErrorHandler;
use WebGUI::Session;

#-------------------------------------------------------------------
sub getParams {
        my ($data, @param);
        $data = $_[0];
        push(@param, $+) while $data =~ m {
                "([^\"\\]*(?:\\.[^\"\\]*)*)",?
                |       ([^,]+),?
                |       ,
        }gx;
        push(@param, undef) if substr($data,-1,1) eq ',';
	return @param;
}

#-------------------------------------------------------------------
sub process {
        my ($macro, $cmd, $output);
	$output = $_[0];
        foreach $macro (keys %{$session{macro}}) {
		$cmd = "WebGUI::Macro::".$macro."::process";
		$output = eval{&$cmd($output)};
		WebGUI::ErrorHandler::fatalError("Processing failed on macro: $macro: ".$@) if($@);
        }
	return $output;
}

1;

