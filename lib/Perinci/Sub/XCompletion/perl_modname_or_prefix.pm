package Perinci::Sub::XCompletion::perl_modname_or_prefix;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Module qw(complete_module);

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        complete_module(
            find_pm     => 1,
            find_pmc    => 1,
            find_pod    => 1,
            find_prefix => 1,
            %cargs, %fargs,
        );
    };
}

1;
# ABSTRACT: Generate completion for perl module name or prefix

=head1 SYNOPSIS


=head1 DESCRIPTION

This creates a completion from list of installed module names or prefixes.

=cut
