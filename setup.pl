#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;

my @HIDDEN_FILES = qw(
    vimrc
    bashrc
    tmux.conf
);

main();

sub main {
    ensure_git_installed();
    copy_hidden_files();
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

