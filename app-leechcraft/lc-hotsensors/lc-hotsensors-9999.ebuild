# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Temperature sensors monitor plugin for LeechCraft"

# We should define license for this plugin explicitly
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}[qwt]
	dev-qt/qtdeclarative:6[widgets]
	sys-apps/lm-sensors:=
"
RDEPEND="${DEPEND}
	~virtual/leechcraft-quark-sideprovider-${PV}"
