package Perinci::Sub::XCompletion;

# DATE
# VERSION

1;
# ABSTRACT: Write completion routines in x.{,element_,index_}completion attributes

=head1 SYNOPSIS

In L<Rinci> metadata:

 args => {
     foo => {
         ...
         'x.completion' => [filename => {file_regex_filter=>qr/\.(yaml|yml)$/i}],
     },
     ...
 },
 ...


=head1 DESCRIPTION

This is a module to support an experimental (and temporary?) way to ease writing
completion routine. Instead of putting a coderef in C<completion> or
C<element_completion> property in argument specification, you put C<$name> or
C<< [$name, \%args] >> in C<x.completion> or C<x.element_completion> or
C<x.index_completion> attributes. C<$name> is the name of
C<Perinci::Sub::XCompletion::*> submodule to use, and \%args is arguments.

But you can also use a coderef as usual.


=head1 SEE ALSO

L<Perinci::Sub::Complete>

=cut
