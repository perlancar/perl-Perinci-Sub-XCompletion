package Perinci::Sub::XCompletion::perl_modprefix;

use 5.010001;
use strict;
use warnings;

use Complete::Module qw(complete_module);

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        complete_module(
            find_pm     => 0,
            find_pmc    => 0,
            find_pod    => 0,
            find_prefix => 1,
            %cargs, %fargs,
        );
    };
}

1;
# ABSTRACT: Generate completion for perl module prefix

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 'x.completion' => 'perl_modprefix',


=head1 DESCRIPTION

This creates a completion from list of installed Perl module prefixes. It passes
arguments to L<Complete::Module>'s C<complete_module>. See its documentation for
list of known arguments.

=cut
