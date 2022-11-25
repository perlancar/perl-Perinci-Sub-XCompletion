package Perinci::Sub::XCompletion::perl_distname;

use 5.010001;
use strict;
use warnings;

use Complete::Dist qw(complete_dist);

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
        complete_dist(%cargs, %fargs);
    };
}

1;
# ABSTRACT: Generate completion for perl distribution name

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 'x.completion' => 'perl_distname',


=head1 DESCRIPTION

This creates a completion from list of installed distribution names. It passes
arguments to L<Complete::Dist>'s C<complete_dist>. See its documentation for
list of known arguments.

=cut
