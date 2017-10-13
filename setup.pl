#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;
use FindBin qw($Bin);

my @HIDDEN_FILES = qw(
    vimrc
    bashrc
    tmux.conf
);

main();

sub main {
    ensure_git_installed();
    copy_hidden_files();
    setup_vim();
}

sub ensure_git_installed {
    if (!-x '/usr/bin/git'      &&
        !-x '/usr/local/bin/git'
    ) {
        die 'git is required';
    }
}

sub copy_hidden_files {
    foreach my $src_file (@HIDDEN_FILES) {
        my $abs_src_file = "$Bin/$src_file";
        my $dst_file = sprintf('~/.%s', $src_file);
        copy $abs_src_file, $dst_file or die "failed to copy src:$src_file, dst:$dst_file $!";
    }
}

sub setup_vim {
    # copy vim setting directory
    my $src = 'vim';
    system "cp -r $src ~/";
    my $dst = sprintf('~/.%s', $src);
    my $bundle_dir = "$dst/bundle";

    mkdir $bundle_dir;
    system "git clone git://github.com/Shougo/neobundle.vim $bundle_dir/neobundle.vim";

    print "you need to execute following vim command\n";
    print ":NeoBundleInstall";
}
