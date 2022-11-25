package Perinci::Sub::XCompletion::dirname;

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(hashify_answer);
use Complete::File qw(complete_dir);

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
        hashify_answer(
            complete_dir(%cargs, %fargs),
            {path_sep => '/'},
        );
    };
}

1;
# ABSTRACT: Generate completion for directory name

=for Pod::Coverage ^(.+)$

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 'x.completion' => 'dirname',

Do not include dotdirs:

 'x.completion' => ['dirname' => {allow_dot=>0}],


=head1 DESCRIPTION

This completion passes arguments to L<Complete::File>'s
L<complete_dir|Complete::File/complete_dir>, so see the documentation of that
module for list of known arguments.

=cut
