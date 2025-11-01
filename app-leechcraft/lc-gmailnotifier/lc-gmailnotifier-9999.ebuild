# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Notifies about new mail in a GMail inbox for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug +notify quark"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[network,xml]
	dev-qt/qtdeclarative:6[widgets]
"
RDEPEND="${DEPEND}
	quark? ( ~virtual/leechcraft-quark-sideprovider-${PV} )
	notify? ( ~virtual/leechcraft-notifier-${PV} )
"

REQUIRED_USE="|| ( notify quark )"
