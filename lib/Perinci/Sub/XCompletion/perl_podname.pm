package Perinci::Sub::XCompletion::perl_podname;

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
        complete_module(find_pm=>0, find_pmc=>0, find_pod=>1, %cargs, %fargs);
    };
}

1;
# ABSTRACT: Generate completion for perl POD name

=head1 SYNOPSIS


=head1 DESCRIPTION

This creates a completion from list of installed POD names.

=cut
