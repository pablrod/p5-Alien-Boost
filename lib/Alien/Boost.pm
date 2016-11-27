package Alien::Boost;

use strict;
use warnings;

# VERSION

use parent 'Alien::Base';

sub Inline {
	return unless $_[-1] eq 'CPP'; # Inline's error message is good
	my $self = __PACKAGE__->new;
	+{
		LIBS => $self->libs,
		INC => $self->cflags,
	};
}

1;

# ABSTRACT: Alien package for the Boost libraries

=pod

=head1 SEE ALSO

L<Boost|http://www.boost.org>

=cut
