#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;

my @HIDDEN_FILES = qw(
    vimrc
    bashrc
    tmux.conf
);

mkdir 'hoge';
#main();

sub main {
    ensure_git_installed();
    #copy_hidden_files();
    setup_vim();
}

sub ensure_git_installed {
    system 'which git' or die 'git is required';
}

sub copy_hidden_files {
    foreach my $src_file (@HIDDEN_FILES) {
        my $dst_file = sprintf('~/.%s', $src_file);
        copy $src_file, $dst_file;
    }
}

sub setup_vim {
    # copy vim setting directory
    my $src = 'vim';
    system "cp -r $src ~/";
    my $dst = sprintf('~/.%s.test', $src);
    my $bundle_dir = "$dst/bundle";

    mkdir $bundle_dir;
    system "git clone git://github.com/Shougo/neobundle.vim $bundle_dir/neobundle.vim";

    print "you need to execute following vim command\n";
    print ":NeoBundleInstall";
}
