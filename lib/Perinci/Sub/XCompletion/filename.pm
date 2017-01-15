package Perinci::Sub::XCompletion::filename;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(hashify_answer);
use Complete::File qw(complete_file);

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

=cut
