package Perinci::Sub::XCompletion::dirname;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::File qw(complete_dir);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        complete_dir(%cargs, %fargs);
    };
}

1;
# ABSTRACT: Generate completion for dirname

=head1 SYNOPSIS

=cut
