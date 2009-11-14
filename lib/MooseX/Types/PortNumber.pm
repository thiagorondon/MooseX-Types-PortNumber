package MooseX::Types::PortNumber;
use strict;
use warnings;

our $VERSION = '0.01';
our $AUTHORITY = 'CPAN:TBR';

use MooseX::Types -declare => [qw(PortNumber PortWellKnow PortRegistered PortPrivate)];
use MooseX::Types::Moose qw(Int);

subtype PortNumber,
    as Int,
    where { $_ >= 0 && $_ <= 65535 },
    message { 'Ports are those from 0 through 65535' };

subtype PortWellKnow,
    as Int, 
    where { $_ >= 0 && $_ <= 1023 },
    message { 'The Well Known Ports are those from 0 through 1023.' };

subtype PortRegistered,
    as Int,
    where { $_ >= 1024 && $_ <= 49151 },
    message { 'The Registered Ports are those from 1024 through 49151' };

subtype PortPrivate,
    as Int,
    where { $_ >= 49152 && $_ <= 65535 },
    message { 'The Dynamic and/or Private Ports are those from 49152 through 65535' };


1;

__END__

=head1 NAME

MooseX::Types::PortNumber - Port number type for moose classes by The Internet Assigned Numbers Authority (IANA).

=head1 SYNOPSIS

    package MyClass;
    use Moose;
    use MooseX::Types::PortNumber qw/PortNumber PortWellKnow PortRegistered PortPrivate/;

    has port => ( isa => PortNumber, is => 'ro' );
    has well => ( isa => PortWellKnow, is => 'ro');
    has reg => ( isa => PortRegistered, is => 'ro');
    has priv => ( isa => PortPrivate, is => 'ro');

=head1 DESCRIPTION

The port numbers are divided into three ranges: the Well Known Ports,
the Registered Ports, and the Dynamic and/or Private Ports.

The Well Known Ports are those from 0 through 1023.

DCCP Well Known ports SHOULD NOT be used without IANA registration.
The registration procedure is defined in [RFC4340], Section 19.9.

The Registered Ports are those from 1024 through 49151

DCCP Registered ports SHOULD NOT be used without IANA registration.
The registration procedure is defined in [RFC4340], Section 19.9.

The Dynamic and/or Private Ports are those from 49152 through 65535

=head1 SEE ALSO

http://www.iana.org/assignments/port-numbers

=head1 AUTHOR

Thiago Rondon C<< <thiago@aware.com.br> >>

Aware TI (L<http://www.aware.com.br/>)

=head1 COPYRIGHT

This program is Free software, you may redistribute it under the same
terms as Perl itself.


