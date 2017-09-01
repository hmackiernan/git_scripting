use strict;
use File::Path qw(mkpath);
use Cwd;
use Data::Dumper;

my $home = getcwd;
$ENV{'GIT_CONFIG'}  = ".gitconfig";

my @users = qw(alice bob);

foreach my $user (@users) {
    mkpath ($user);

}

foreach my $user_dir (@users) {
    chdir $user_dir;
    print `pwd`;
    my @ret = `git config --file=.gitconfig user.name $user_dir`;
    print Dumper(\@ret);

    my @ret = `git config --list`;
    print Dumper(\@ret);

    chdir $home;
}

