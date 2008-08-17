# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/whois/whois-4.7.26.ebuild,v 1.5 2008/08/16 15:30:19 vapier Exp $

EAPI="prefix"

inherit eutils toolchain-funcs

MY_P=${P/-/_}
DESCRIPTION="improved Whois Client"
HOMEPAGE="http://www.linux.it/~md/software/"
SRC_URI="mirror://debian/pool/main/w/whois/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86-freebsd ~amd64-linux ~x86-linux"
IUSE="nls"
RESTRICT="test" #59327

RDEPEND="net-dns/libidn"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-4.7.26-gentoo-security.patch
	epatch "${FILESDIR}"/${PN}-4.7.2-config-file.patch
	epatch "${FILESDIR}/${PN}-4.7.26-fix-as-needed.patch"

	if use nls ; then
		cd po
		sed -i -e "s:/usr/bin/install:install:" Makefile
	else
		sed -i -e '/ENABLE_NLS/s:define:undef:' config.h
		sed -i -e "s:cd po.*::" Makefile
	fi
}

src_compile() {
	tc-export CC
	emake OPTS="${CFLAGS}" HAVE_LIBIDN=1 || die
}

src_install() {
	dodir /usr/bin /usr/share/man/man1
	make BASEDIR="${D}" prefix="${EPREFIX}"/usr install || die
	insinto /etc
	doins whois.conf
	dodoc README

	if [[ "${USERLAND}" != "GNU" ]]; then
		mv "${ED}"/usr/share/man/man1/{whois,mdwhois}.1
		mv "${ED}"/usr/bin/{whois,mdwhois}
	fi
}
