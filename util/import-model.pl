#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use lib 'lib';
use Params::Util qw( _HASH );
use JSON::XS ();
use JSON::Syck;
#use WWW::OpenResty::Simple;
use Data::Dumper;
use Data::Structure::Util qw(_utf8_on _utf8_off);
use DBI;

sub usage {
    my $progname;
    if ($0 =~ m{[^/\\]+$}) {
        $progname = $&;
    }
    return <<_EOC_;
Usage: $progname [options] <json_file>
Options:
    --user <user>      OpenResty user (i.e. agentzh.Admin)
    --password <s>     OpenResty password for the user specified
    --model <model>    OpenResty model name being imported
    --server <host>    OpenResty server hostname
    --step <num>       Size of the bulk insertion group
    --retries <num>    Number of automatic retries when failures occur
    --no-id            Skipped the id field in the records being imported
    --skip N           Skipped the first N rows in the input file (default 0)
    --add-id N          Add ID started from N (default 1)
    --update-col <col>  Update records according to the column given
    --ignore-dup-error  Ignore dupliciate errors
_EOC_
}

my $server = 'api.openresty.org';
my $step = 20;
my $skip = 0;
my $add_id = 1;
my $update_col;
GetOptions(
    'help|h'   => \(my $help),
    'user|u=s' => \(my $user),
    'model=s' => \(my $model),
    'server=s' => \$server,
    'password=s' => \(my $password),
    'step=i' => \$step,
    'reset' => \(my $reset),
    'retries=i' => \(my $retries),
    'no-id' => \(my $no_id),
    'skip=i' => \$skip,
    'add-id=i' => \$add_id,
    'ignore-dup-error' => \(my $ignore_dup_error),
    'update-col=s' => \$update_col,
    'port=s' => \(my $port),
) or die usage();

if ($help) { print usage() }

$user or die "No --user given.\n";
$model or die "No --model given.\n";

my $json_xs = JSON::XS->new->utf8->allow_nonref;

my $database = 'test';

$port ||= 3306;

my $dsn = "DBI:mysql:database=$database;host=$server;port=$port;mysql_server_prepare=1";
my $dbh = DBI->connect($dsn, $user, $password, { RaiseError => 1, AutoCommit => 0 });

if ($reset) {
    $dbh->do("truncate $model");
}

if ($update_col) { $step = 1 }

my @rows;
my $inserted = 0;
local $| = 1;

my ($sth);

my @cols;
while (<>) {
    #select(undef, undef, undef, 0.1);
    #warn "count: ", scalar(@elems), "\n";
    next if $. <= $skip;
    my $row = $json_xs->decode($_);
    #my $row = JSON::Syck::Load($_);


    if (!defined $row->{id}) {
        #warn "ADDing id...\n";
        $row->{id} = $add_id++;
    }
    if ($no_id) {
        delete $row->{id};
    }

    if (!defined $sth) {
        @cols = reverse sort keys %$row;
        my $cols = join ',', @cols;
        my @holders = map { '?' } @cols;
        my $holders = join ',', @holders;
        $sth = $dbh->prepare("insert into $model ($cols) values ($holders)");
    }

    my @vals;
    for my $col (@cols) {
        push @vals, $row->{$col};
    }

    $sth->execute(@vals);
    $inserted++;

    if ($inserted % $step == 0) {
        print STDERR "\r", ($update_col ? "Updated" : "Inserted"), " rows: $inserted (row $.)";
    }
}

print STDERR "\n$inserted row(s) inserted.\n";

$dbh->disconnect();

warn "\nFor tatal $inserted records inserted.\n";
#print encode('UTF-8', YAML::Syck::Dump(\@rows));

