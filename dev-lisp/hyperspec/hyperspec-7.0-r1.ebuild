# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/hyperspec/hyperspec-7.0-r1.ebuild,v 1.3 2008/07/16 14:11:13 aballier Exp $

MY_PV=${PV/./-}
MY_P=HyperSpec-${MY_PV}

DESCRIPTION="Common Lisp ANSI-standard Hyperspec"
HOMEPAGE="http://www.lispworks.com/reference/HyperSpec/"
SRC_URI="ftp://ftp.lispworks.com/pub/software_tools/reference/${MY_P}.tar.gz"
LICENSE="HyperSpec"
SLOT="0"
KEYWORDS="~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""
DEPEND=""

RESTRICT="mirror fetch"

S=${WORKDIR}/

pkg_nofetch() {
	while read line; do elog "${line}"; done <<EOF

The HyperSpec cannot be redistributed. Download the ${MY_P}.tar.gz
file from http://www.lispworks.com/documentation/HyperSpec/ and move it to
/usr/portage/distfiles before rerunning emerge. The legal conditions are
described at http://www.lispworks.com/reference/HyperSpec/Front/Help.htm#Legal

EOF
}

src_install() {
	dodir /usr/share/doc/${P}
	cp -r HyperSpec* ${ED}/usr/share/doc/${P}
	dosym /usr/share/doc/${P} /usr/share/doc/hyperspec
}
