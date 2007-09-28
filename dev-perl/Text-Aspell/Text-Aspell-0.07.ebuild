# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-Aspell/Text-Aspell-0.07.ebuild,v 1.1 2007/04/16 11:45:51 mcummings Exp $

EAPI="prefix"

inherit perl-module

DESCRIPTION="Perl interface to the GNU Aspell Library"
SRC_URI="mirror://cpan/authors/id/H/HA/HANK/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~hank/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~amd64 ~ia64 ~ppc-macos ~sparc-solaris ~x86 ~x86-solaris"
IUSE=""

# Disabling tests for now - see bug #147897 --ian
#SRC_TEST="do"

DEPEND="app-text/aspell
	dev-lang/perl"
