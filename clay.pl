#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use Getopt::Long;
use HTTP::Request;
use LWP::UserAgent;
use IO::Select;
use HTTP::Headers;
use IO::Socket;
use HTTP::Response;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use IO::Socket::INET;
use Data::Dumper;
use LWP::Simple;
use JSON qw( decode_json encode_json );

my $ua = LWP::UserAgent->new;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

GetOptions(
    "h|help" => \$help,
);

if ($help) { banner();help(); }
unless ($help|$imei) { banner();menu(); }

##### Help #######
sub help {
    print item('1'),"Imei information scanner";
    print color('bold red'),"=> ";
    print color("bold white"),"perl Clay -i 15 digit\n";

##### Banner #######
sub banner {
    if ($^O =~ /MSWin32/) {system("mode con: cols=100 lines=29");system("cls"); }else { system("resize -s 28 87");system("clear"); }
print colour('bold green')," Designed by godfrey mbuva\n";
print colour('bold green')," great thanks to Mr.D3str0y3r & Root_mzizi\n";
print colour('bold red'),"Use it for your own risk\n;
print colour('bold red'),"Am not responsible of any miss use\n";


##### Menu #######
sub menu {
    print item('01'),"Imei information scanner\n";
     print item('-'),"Choose : ";
    print color('reset');

chomp($number=<STDIN>);

    if($number eq '01'){
        banner();
        print item(),"Inter imei number : ";
chomp($imei=<STDIN>);
        banner();
        ImeiInfomartion();
        enter();

####Phone number information#####
sub imeiinformation {
  $ua = LWP::UserAgent->new(keep_alive => 1);
    $ua->agent("Mozilla/5.0 (Windows NT 10.0; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0");
    my $url ="https://www.imei.info/?imei=$imei#basic";
  $request = $ua->get($url);
    $response = $request->content;
       if (exists $responseObject->{'imeiInformation'}->{''}){
        print item(),"Informatio  for : $imei \n";
        print item(),'Infotmation found: ',
}else {
        print item(),"There Is A Problem\n\n";
        print item('1'),"Checking The Connection\n";
        print item('2'),"Enter valid imei\n";
        print item('3'),"Make sure imei contain 15digit\n";
    }
}

##### Enter #######
sub enter {
    print "\n";
    print item(),"Press ";
    print color('bold red'),"[";
    print color("bold white"),"ENTER";
    print color('bold red'),"] ";
    print color("bold white"),"Key To Continue\n";

    local( $| ) = ( 1 );

    my $resp = <STDIN>;
    banner();
    menu();
}

### Item format ###
sub item
{
    my $n = shift // '+';
    return color('bold red')," ["
    , color('bold green'),"$n"
    , color('bold red'),"] "
    , color("bold white")
    ;
}
__END__
