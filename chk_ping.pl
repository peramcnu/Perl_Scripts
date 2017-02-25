#!/usr/bin/perl
# Provided txt file, will write the output to report.txt file.     
    use Net::Ping;
    use Fcntl;
	use Term::ANSIColor qw(:constants);
	print GREEN, "Go!\n", RESET;
    open(CFILE, $ARGV[0]);
	@inp=<CFILE>;
	close (CFILE);

	if ($ARGV[0] eq "")
	{
        print "missing required parameters\n";
        print "usage: Ping_status.pl [File_Name]\n";
        exit;
	}
     
    $p = Net::Ping->new();
     
    foreach (@inp) {
        #		print "Processing $_";
            if ($p->ping($_)) {
                print GREEN ("$_ \r","ping is SUCCESS!!!!!\n"), RESET;
				#print "$& \n";
            } else {
                print RED ("$_","\t"," REQ TIMED OUT  \n"), RESET;
				     }
        	    }
print "done\n";
