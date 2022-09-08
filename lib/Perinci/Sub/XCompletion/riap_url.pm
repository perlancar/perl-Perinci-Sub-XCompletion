package Perinci::Sub::XCompletion::riap_url;

use 5.010001;
use strict;
use warnings;

use Complete::Riap ();

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
        Complete::Riap::complete_riap_url(%cargs, %fargs);
    };
}

1;
#ABSTRACT: Generate completion for Riap URL

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

=cut
