# use with -i''
# I'm symlinking this from .git/hooks/commit_updater.pl but you'd normally just
# put it in the hooks/ directory. I can't track this file otherwise

my %fmt = qw(1 st 2 nd 3 rd);
my $num_commits = `git rev-list HEAD --count`;

sub format_commit {
  my $n = shift;
  my $digit = $n % 10;
  return $n . ($fmt{$digit} || "th")
}

while (<>) {
  s/\d+(st|nd|rd|th)(?= commit)/format_commit($num_commits + 1)/eg;
  print;
}
