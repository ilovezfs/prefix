# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/ftjam/ftjam-2.5.3_rc2.ebuild,v 1.13 2008/08/03 08:35:40 dirtyepic Exp $

inherit eutils versionator

MY_PV=$(delete_version_separator _)

DESCRIPTION="Jam is a powerful alternative to make.  FTJam is a 100% compatible enhanced Jam implementation."
HOMEPAGE="http://freetype.sourceforge.net/jam/index.html"
SRC_URI="http://david.freetype.org/jam/ftjam-${MY_PV}.tar.bz2"

LICENSE="perforce GPL-2"
SLOT="0"
KEYWORDS="~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

DEPEND="!dev-util/jam
	sys-devel/bison"
RDEPEND="!dev-util/jam"

S=${WORKDIR}/${PN}-${MY_PV}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/ftjam-2.5.3-nostrip.patch
	epatch "${FILESDIR}"/ftjam-2.5.3-i-hate-yacc.patch
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README README.ORG CHANGES INSTALL RELNOTES
	dohtml Jam.html Jambase.html Jamfile.html
}
