use strict;
use File::Path qw(mkpath);
use Cwd;
use Data::Dumper;

my $home = getcwd;
$ENV{'GIT_CONFIG'}  = ".gitconfig";

my @dirs = qw(alice bob);

foreach my $dir (@dirs) {
    mkpath ($dir);

}

foreach my $dir (@dirs) {
    chdir $dir;
    print `pwd`;
    my @ret = `git config --file=.gitconfig user.name $dir`;
    print Dumper(\@ret);

    my @ret = `git config --list`;
    print Dumper(\@ret);

    chdir $home;
}

