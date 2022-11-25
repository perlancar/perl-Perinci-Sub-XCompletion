package Perinci::Sub::XCompletion::perl_modname;

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
        complete_module(%cargs, %fargs);
    };
}

1;
# ABSTRACT: Generate completion for perl module name

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 'x.completion' => 'perl_modname',


=head1 DESCRIPTION

This creates a completion from list of installed Perl module names. It passes
arguments to L<Complete::Module>'s C<complete_module>. See its documentation for
list of known arguments.

=cut
