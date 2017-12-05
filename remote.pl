#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI::Vars();

my %codes;
$codes{'pow'} = 'KEY_POWER';
$codes{'volup'} = 'KEY_VOLUMEUP';
$codes{'voldown'} = 'KEY_VOLUMEDOWN';
$codes{'chup'} = 'KEY_CHANNELUP';
$codes{'chdown'} = 'KEY_CHANNELDOWN';
$codes{'ch0'} = 'KEY_0';
$codes{'ch1'} = 'KEY_1';
$codes{'ch2'} = 'KEY_2';
$codes{'ch3'} = 'KEY_3';
$codes{'ch4'} = 'KEY_4';
$codes{'ch5'} = 'KEY_5';
$codes{'ch6'} = 'KEY_6';
$codes{'ch7'} = 'KEY_7';
$codes{'ch8'} = 'KEY_8';
$codes{'ch9'} = 'KEY_9';
$codes{'mute'} = 'KEY_MUTE';

my $mode;
my $key =$q->{'code'}; 
my $code='';
$code=$codes{ $key};

if ($q->{'mode'} eq 'start'){
	$mode='SEND_START';
} elsif ($q->{'mode'} eq 'stop'){
	$mode='SEND_STOP';
}else {$mode='SEND_ONCE'};

my $str = 'irsend '.$mode.' SAMSUNG '.$code;
exec($str);

print "Content-type: text/plain\n";
print "success";