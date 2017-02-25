#!/usr/bin/perl
# Provided txt file, will write the output to report.txt file.     
    use Net::Ping;
    use Fcntl;
	use Term::ANSIColor qw(:constants);
	open(CFILE, $ARGV[0]);
	@inp=<CFILE>;
	close (CFILE);

	if ($ARGV[0] eq "")
	{
        print "missing required parameters\n";
        print "usage: Ping_status.pl [File_Name]\n";
        exit;
	}
     
open(my $fh, '>', 'report.txt');
 
    $p = Net::Ping->new();
     
    foreach (@inp) {
        if ($_ =~ /\d+.\d+.\d+.\d+/) {
        if ($p->ping($&)) {
                print GREEN, ("$&","\t"," ping is SUCCESS!!!!!\n"), RESET;
				#print "$& \n";
            } else {
                print RED, ("$&","\t"," REQ TIMED OUT  \n"),RESET ;
				#print "$& \n";
            }
        } else {
            #print " ip address is not valid \n";
			print RED, ("$_,"," ip address is not valid \n"), RESET;
            #print "$_\n";
        }
    }
close $fh;
print "done\n";


#print RED, "$host - Not Found \n", RESET;