use strict;
use IO::File;
use Getopt::Long;
use Data::Dumper;
my %options= ();

GetOptions(\%options,
	   "repo_dir:s",
	   "repo_name=s",
	  );
my $packs = $options{'repo_dir'}. "/.git/objects/pack";
my $packed_refs=$options{'repo_dir'}. "/.git/packed-refs";

print "we got $packs\n";
my @objects = <$packs/*.*>;
my $allObjects = join ' -i ', @objects;
my $cmd="p4 graph receive-pack -n $options{'repo_name'} -i $allObjects -p $packed_refs";
print " \$cmd is $cmd\n";
print "\n\n";
my $msg =` $cmd`;
print $msg;

__END__
chomp( my $masterRef = read_file "$mainRoot/.git/refs/heads/master" );
my $allObjects = join ' -i ', @objects;
