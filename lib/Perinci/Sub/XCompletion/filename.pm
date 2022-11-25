package Perinci::Sub::XCompletion::filename;

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(hashify_answer);
use Complete::File qw(complete_file);

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
            complete_file(%cargs, %fargs),
            {path_sep => '/'},
        );
    };
}

1;
# ABSTRACT: Generate completion for filename

=head1 SYNOPSIS

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 'x.completion' => 'filename',

Only complete with C<*.srt> and C<*.SRT> files:

 'x.completion' => ['filename' => {file_ext_filter => qr/\.srt$/i}],


=head1 DESCRIPTION

This completion passes arguments to L<Complete::File>'s
L<complete_file|Complete::File/complete_file>, so see the documentation of that
module for list of known arguments.

=cut
