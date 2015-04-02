package Perinci::Sub::XCompletion;

# DATE
# VERSION

1;
# ABSTRACT: Write completion routines in x.{element_,}completion attributes

=head1 DESCRIPTION

This is a module to support an experimental (and temporary?) way to ease writing
completion routine. Instead of putting a coderef in C<completion> or
C<element_completion> property in argument specification, you put C<<[$name,
\%args]>> in C<x.completion> or C<x.element_completion> attributes. C<$name> is
the name of submodule to use, and \%args is arguments.


=head1 SEE ALSO

L<Perinci::Sub::Complete>

=cut
