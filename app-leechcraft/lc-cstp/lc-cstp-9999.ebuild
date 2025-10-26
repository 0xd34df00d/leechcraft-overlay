# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft optfeature

DESCRIPTION="CSTP, the clean & stupid HTTP implementation for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[network,widgets]
"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog "Consider installing the following for additional features:"
	optfeature "displaying and controlling the downloads" virtual/leechcraft-task-show
}
