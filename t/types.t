use Test::Most;

use Pred::Types qw(blessed identifier identifier_atom integer nil number pos_simple pos_string simple string);

# That it didn't error out in importing is enough of a test for blessed
ok(1,"blessed");

eq_or_diff(scalar identifier("f"),1);
eq_or_diff(scalar identifier("foo"),1);
eq_or_diff(scalar identifier("foo::bar"),1);
eq_or_diff(scalar identifier("foo123::bar"),1);
eq_or_diff([identifier("1foo")],[]);
eq_or_diff(scalar identifier("1foo"),undef);
eq_or_diff([identifier("1")],[]);
eq_or_diff(scalar identifier("1"),undef);
eq_or_diff([identifier("f:1a")],[]);
eq_or_diff(scalar identifier("f:1a"),undef);

eq_or_diff(scalar identifier_atom("f"),1);
eq_or_diff(scalar identifier_atom("foo"),1);
eq_or_diff([identifier_atom("foo::bar")],[]);
eq_or_diff(scalar identifier_atom("foo::bar"),undef);
eq_or_diff([identifier_atom("foo123::bar")],[]);
eq_or_diff(scalar identifier_atom("foo123::bar"),undef);
eq_or_diff([identifier_atom("1foo")],[]);
eq_or_diff(scalar identifier_atom("1foo"),undef);
eq_or_diff([identifier_atom("1")],[]);
eq_or_diff(scalar identifier_atom("1"),undef);
eq_or_diff([identifier_atom("f:1a")],[]);
eq_or_diff(scalar identifier_atom("f:1a"),undef);

eq_or_diff(scalar integer('1234'),1),
eq_or_diff([integer('123.4')],[]),
eq_or_diff(scalar integer('123.4'),undef),
eq_or_diff([integer('foo')],[]),
eq_or_diff(scalar integer('foo'),undef),
eq_or_diff([integer([])],[]),
eq_or_diff(scalar integer([]),undef),

eq_or_diff(nil(undef),1);
eq_or_diff([nil(1)],[]);
eq_or_diff(scalar nil(1), undef);

eq_or_diff(number("123"),1);
eq_or_diff(number("123.45"),1);
eq_or_diff(number("123."),1);
eq_or_diff([number("foo")],[]);
eq_or_diff(scalar number("foo"),undef);

eq_or_diff(pos_simple("a"),1);
eq_or_diff([pos_simple(0)],[]);
eq_or_diff(scalar pos_simple(0),undef);
eq_or_diff(pos_simple(1),1);
eq_or_diff([pos_simple(undef)],[]);
eq_or_diff(scalar pos_simple(undef),undef);
eq_or_diff([pos_simple("")],[]);
eq_or_diff(scalar pos_simple(""),undef);

eq_or_diff(pos_string("a"),1);
eq_or_diff([pos_string(0)],[]);
eq_or_diff(scalar pos_string(0),undef);
eq_or_diff([pos_string(1)],[]);
eq_or_diff(scalar pos_string(1),undef);
eq_or_diff([pos_string(undef)],[]);
eq_or_diff(scalar pos_string(undef),undef);
eq_or_diff([pos_string("")],[]);
eq_or_diff(scalar pos_string(""),undef);

eq_or_diff(simple("foo"),1);
eq_or_diff([simple([])],[]);
eq_or_diff(scalar simple([]),undef);

eq_or_diff(string("foo"),1);
eq_or_diff([string([])],[]);
eq_or_diff(scalar string([]),undef);
eq_or_diff([string(123)],[]);
eq_or_diff(scalar string(123),undef);

done_testing;
