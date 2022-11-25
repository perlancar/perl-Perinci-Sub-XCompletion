package Perinci::Sub::XCompletion::comma_sep;

use 5.010001;
use strict;
use warnings;

use Complete::Util qw(hashify_answer);

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

sub _gen {
    my ($submod) = @_;
    my $xcargs;

    if (ref $submod eq 'ARRAY') {
        $xcargs = $submod->[1];
        $submod = $submod->[0];
    } else {
        $xcargs = {};
    }

    no strict 'refs'; ## no critic: TestingAndDebugging::ProhibitNoStrict
    my $mod = "Perinci::Sub::XCompletion::$submod";
    (my $mod_pm = "$mod.pm") =~ s!::!/!g;
    require $mod_pm;

    &{"$mod\::gen_completion"}(%$xcargs);
}

$SPEC{gen_completion} = {
    v => 1.1,
    # XXX parameter 'uniq'
};
sub gen_completion {
    my %fargs = @_;
    sub {
        my %cargs = @_;
        my $word = $cargs{word};

        my $xcompletion = _gen($fargs{xcompletion});

        # XXX grok backslash escape
        my ($prev_items, $cur_item) = $word =~ /\A(.*,)?(.*)/;
        $prev_items //= "";

        my $ans = hashify_answer($xcompletion->(word => $cur_item));
        return unless $ans;
        for my $word (@{ $ans->{words} }) {
            # reattach the previous items
            if (ref $word eq 'HASH') {
                $word->{word} = $prev_items . $word->{word};
            } else {
                $word = $prev_items . $word;
            }
        }
        $ans;
    };
}

1;
# ABSTRACT: Generate completion for completing a comma-separated list of other completion

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

In L<argument specification|Rinci::function/"args (function property)"> of your
L<Rinci> L<function metadata|Rinci::function>:

 # complete a comma-separated list of unix users
 'x.completion' => [comma_sep => {xcompletion => 'unix_user'}],

 # complete an argument in the form of FILENAME,UNIX_USER,WORDLIST_MODULE_NAME
 'x.completion' => [comma_sep => {xcompletions => ['filename', 'unix_user', [perl_modname => {ns_prefix=>"WordList"}]]}],


=head1 DESCRIPTION

This completion lets you string several completions together in a
comma-separated list.


=head1 PARAMETERS

=head2 xcompletion

The C<Perinci::Sub::XCompletion::*> module name, without the prefix, to generate
completion for all the items ih the comma-separated list. Or, a 2-element array
containing module name and hash of parameters for the module.

Examples:

 xcompletion => 'unix_user',
 xcompletion => [perl_modname => {ns_prefix=>"WordList"}],

Either this parameter or L</xcompletions> must be specified.

=head2 xcompletions

An array containing list of completions to generate for each corresponding item
in the comma-separated list. Each element of the C<xcompletions> list should be
the C<Perinci::Sub::XCompletion::*> module name without the prefix, or a
2-element array containing module name and hash of parameters for the module.

Example:

 xcompletions => ['filename', 'unix_user', [perl_modname => {ns_prefix=>"WordList"}]],

Either this parameter or L</xcompletion> must be specified.


=head1 SEE ALSO

L<Complete::Sequence>

=cut
