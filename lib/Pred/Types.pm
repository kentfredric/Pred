package Pred::Types;

use List::Util qw(all);
use Scalar::Util qw(blessed looks_like_number);
use Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(blessed coderef identifier identifier_atom integer nil number pos_simple pos_string simple string);

sub coderef {
  return unless ref($_[0]) eq 'CODE'; 1;
}

sub identifier_atom {
  return unless ($_[0] =~ /^(?:[a-zA-Z_]+[a-zA-Z0-9_]*)$/); 1;
}

sub identifier {
  return unless all {identifier_atom($_)} split("::", $_[0]); 1;
}

sub integer {
  return unless ($_[0] =~ /^[0-9]+$/); 1;
}

sub nil {
  return if defined($_[0]); 1;
}

sub number {
  return unless looks_like_number($_[0]); 1;
}

sub pos_simple {
  return unless $_[0] && simple($_[0]); 1;
}

sub pos_string {
  return unless $_[0] && string($_[0]); 1;
}

sub string {
  return if ref($_[0]) || number($_[0]); 1;
}

sub simple {
  return if ref($_[0]); 1;
}

1
__END__
