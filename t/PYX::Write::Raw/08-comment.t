# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Write::Raw;
use Test::More 'tests' => 2;
use Test::Output;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Test.
my $obj = PYX::Write::Raw->new;
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('comment1.pyx')->s);
		return;
	},
	'<!--comment-->',
);

# Test.
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('comment2.pyx')->s);
		return;
	},
	"<!--comment\ncomment-->"
);
