#!/usr/bin/perl
use warnings;
use strict;
#use Net::Nslookup;
use Term::ANSIColor qw(:constants);
print GREEN, "Go!\n", RESET;
open (FILE, $ARGV[0]);

while (<FILE>){
        my $host = $_;
        chomp($host);
        next unless $host;
        #print "Processing $_\n";
        resolve_dns($host);
}
close FILE;
open(my $fh, '>', 'report.txt');
sub resolve_dns{
        my $host = shift;
        my $dns = `host $host`;
        if ($dns){
                print "$dns";
#                print "\n";
        #       print "$host,$dns";
        }
		else {
		print RED, "$host - Not Found \n", RESET;
#                print "\n";
		     }
}
close $fh;
#print "\n";
print RED, "Done!\n",RESET;
