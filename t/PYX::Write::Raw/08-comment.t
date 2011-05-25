# Modules.
use File::Object;
use PYX::Write::Raw;
use Test::More 'tests' => 2;

# Directories.
my $data_dir = File::Object->new->up->dir('data')->serialize;

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->serialize;

print "Testing: Comment writing.\n";
my $obj = PYX::Write::Raw->new;
my $ret = get_stdout($obj, $data_dir.'/comment1.pyx');
is($ret, '<!--comment-->');

$ret = get_stdout($obj, $data_dir.'/comment2.pyx');
is($ret, "<!--comment\ncomment-->");