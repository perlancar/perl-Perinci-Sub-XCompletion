package Perinci::Sub::XCompletion::perl_distname;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Dist qw(complete_dist);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        complete_dist(%cargs, %fargs),
    };
}

1;
# ABSTRACT: Generate completion for perl distribution name

=head1 SYNOPSIS


=head1 DESCRIPTION

This creates a completion from list of installed distribution names.

=cut
