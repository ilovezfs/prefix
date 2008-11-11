# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-netload/xfce4-netload-0.4.0.ebuild,v 1.17 2008/11/10 18:24:37 angelos Exp $

EAPI="prefix"

inherit xfce44 eutils autotools

xfce44

DESCRIPTION="Netload panel plugin"
KEYWORDS="~x86-freebsd ~amd64-linux ~x86-linux"
IUSE=""
DEPEND=">=dev-util/xfce4-dev-tools-${XFCE_MASTER_VERSION}
	dev-util/intltool"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-asneeded.patch
	AT_M4DIR="${EPREFIX}"/usr/share/xfce4/dev-tools/m4macros eautoreconf
	intltoolize --force
}

xfce44_goodies_panel_plugin
