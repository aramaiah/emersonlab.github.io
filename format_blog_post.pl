#!/usr/bin/env perl
use warnings;
use strict;
use Getopt::Long;
use Pod::Usage;
use Data::Dumper;
use Getopt::Long qw(GetOptionsFromArray :config no_ignore_case);
use Date::Parse qw(strptime);
use Unicode::Normalize;
use Text::Unidecode;
use Encode;
use POSIX qw(strftime);

sub slugify_url($) {
    my ($input) = @_;
    my $len = 50;
    my $rand = 4;
    my $digits = sprintf("%04.0f", rand(10**$rand));

    $input = decode_utf8($input);  # Make sure we're dealing with Unicode
    $input = NFC($input);          # Normalize (recompose) the Unicode string
    $input = unidecode($input);    # Convert non-ASCII characters to closest equivalents
    $input =~ s/[^\w\s-]//g;       # Remove all characters that are not word characters (includes _), spaces, or hyphens
    $input =~ s/^\s+|\s+$//g;      # Trim whitespace from both ends
    $input = lc($input);
    $input =~ s/[-\s]+/-/g;        # Replace all occurrences of spaces and hyphens with a single hyphen
    $input = substr($input, 0, $len-$rand-1);# Truncate string after 50 characters
    $input = $input . $digits;

    return $input;
}

my $cparams =
  {
          help => undef,
           man => undef,
        infile => undef,
        outdir => undef,
         title => undef,
        author => undef,
          page => undef,
          date => POSIX::strftime("%Y-%m-%d %H:%M:%S %z", localtime),
    nocomments => undef,
  };

GetOptions
  (
   # General commandline processing.
          'help|h|?' => \$cparams->{'help'},
             'man|m' => \$cparams->{'man'},
        'infile|i=s' => \$cparams->{'infile'},
        'outdir|o=s' => \$cparams->{'label'},
         'title|t=s' => \$cparams->{'title'},
    'author|a:s@{,}' => \$cparams->{'author'},
       'url|u:s@{,}' => \$cparams->{'url'},
          'date|d=s' => \$cparams->{'date'},
      'nocomments|n' => \$cparams->{'nocomments'},
  ) || pod2usage(2);

my @strptime = strptime($cparams->{'date'});
# Month is 0-based and year is -1900.
my $dateonly = sprintf("%4d-%02d-%02d", $strptime[5]+1900, $strptime[4]+1, $strptime[3]);
print Dumper($cparams);

print slugify_url(sprintf("%s %s", $dateonly, $cparams->{'title'}[0])), "\n";

pod2usage(-verbose => 2) if $cparams->{'man'};
pod2usage() if $cparams->{'help'};

########################
# Documentation below. #
########################

__END__

=head1 NAME

format_blog_post - This script accepts a markdown document and formats
a blog post and outputs it to the appropriate filename.

=head1 SYNOPSIS

format_blog_post [[--help|-h|-?]] [[--man|-m]] [--infile|-i] I<filename> [--title|-t] I<posttitle>
[[--outdir|-o] I<directoryname>] [[--author|-a] 'I<Author Name>' ... ] [[--url|-u] 'I<Author URL>' ... ] 
[[--date|-d] 'I<%Y-%m-%d %I:%M:%S%p %z>'] [[--nocomments|-n]]

Options:

=over 8

--help, -h, -?

=over 4

Brief help message.

=back

--man, -m

=over 4

Full documentation in man format. Requires that perl-doc be installed.

=back

--infile, -i I<filenae>

=over 4

Input file containing the blog post formatted in markdown.

=back

--title, -i I<posttitle>

=over 4

Title of blog post.

=back

=back

=head1 OPTIONS

=over 8

=item B<--help, -h, -?>

Print a brief help message and exit.

=item B<--man, -m>

Load full documentation in manual page format into the pager and exit.

=item B<--infile, -i> I<filename>

The input file containing the blog post in markdown format. The title
should be omitted from this document as it will be added by the blog
formatting template.

=item B<--title, -t> I<posttitle>

The title of the blog post. The title will be placed at the top of the
document immediately after the header and will formatted with the
markdown H1 header. The title will also serve as the part of the name
following the date in the newly created file, with whitespace replaced
by dashes.

=item B<--outdir, -o> I<directoryname>

Optional. Path to directory where the output will be written. Defaults
to './'.

=item B<--author, -a> 'I<Author Name 1>' ['I<Author Name 2>' ...]

Optional. Name of the author of the blog post. If the name contains
spaces, it should be surrounded by quotes. This parameter accepts
multiple arguments, each separated by spaces. If this parameter is used
with B<--url, -u>, then both should have the same number of arguments.

=item B<--infile, -i> I<filename>

The input file containing the blog post in markdown format. The title
should be omitted from this document as it will be added by the blog
formatting template.

=item B<--title, -t> I<title>

The title of the blog post. The title will be placed at the top of the
document immediately after the header and will formatted with the
markdown H1 header. The title will also serve as the part of the name
following the date in the newly created file, with whitespace replaced
by dashes.

=back

=head1 DESCRIPTION

B<run_codeml.pl> will do something.

This tool organizes PAML analyses into two major categories of parameters: 1) Global options which are common to all analyses specified; 2) model specific options which change the behavior of individual PAML runs or pairs of PAML runs. As a result, command line options are processed in blocks or "stanzas" separated by naked dash pairs (i.e. '--' without a switch name). Global options must always appear in the first stanza. The second and subsequent stanzas all specify different PAML models.

=head1 EXAMPLES

# The following are all acceptable:

$ XXXXX.pl --foo bar

=head1 AUTHOR

Written by J.J. Emerson.

=head1 REPORTING BUGS

Report all bugs to J.J. Emerson <jj.emerson@gmail.com>.

=cut
