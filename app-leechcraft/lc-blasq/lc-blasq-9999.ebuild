# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit leechcraft

DESCRIPTION="Cloud image storage services client (like Flickr or Picasa)"

SLOT="0"
KEYWORDS=""
IUSE="debug +deathnote +rappor +spegnersi +vangog"

DEPEND="
	~app-leechcraft/lc-core-${PV}
	dev-qt/qtbase:6[network,widgets,xml]
	dev-qt/qtdeclarative:6[widgets]
	spegnersi? ( dev-qt/qtnetworkauth:6 )
	"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_BLASQ_DEATHNOTE=$(usex deathnote)
		-DENABLE_BLASQ_RAPPOR=$(usex rappor)
		-DENABLE_BLASQ_SPEGNERSI=$(usex spegnersi)
		-DENABLE_BLASQ_VANGOG=$(usex vangog)
	)

	cmake_src_configure
}
