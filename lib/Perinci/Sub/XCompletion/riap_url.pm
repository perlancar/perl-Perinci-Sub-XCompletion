package Perinci::Sub::XCompletion::riap_url;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Complete::Riap ();

our %SPEC;

$SPEC{gen_completion} = {
    v => 1.1,
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        Complete::Riap::complete_riap_url(%cargs, %fargs);
    };
}

1;
#ABSTRACT: Generate completion for Riap URL

=head1 SYNOPSIS

=cut
