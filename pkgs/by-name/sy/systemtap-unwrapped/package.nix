{ lib
, stdenv
, fetchgit
, pkg-config
, gettext
, cpio
, elfutils
, python3
, boost
,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "systemtap";
  version = "5.3";

  src = fetchgit {
    url = "git://sourceware.org/git/systemtap.git";
    rev = "release-${finalAttrs.version}";
    hash = "sha256-W9iJ+hyowqgeq1hGcNQbvPfHpqY0Yt2W/Ng/4p6asxc=";
  };

  nativeBuildInputs = [
    pkg-config
    cpio
    python3
    python3.pkgs.setuptools
  ];
  buildInputs = [
    elfutils
    gettext
    python3
    boost
  ];
  enableParallelBuilding = true;

  meta = {
    homepage = "https://sourceware.org/systemtap/";
    description = "Provides a scripting language for instrumentation on a live kernel plus user-space";
    license = lib.licenses.gpl2;
    platforms = lib.systems.inspect.patterns.isGnu;
  };
})
