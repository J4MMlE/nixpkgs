{
  lib,
  stdenv,
  fetchurl,
  pkg-config,
  libjack2,
  alsa-lib,
  liblo,
  libsndfile,
  lv2,
  qtbase,
  qttools,
  rubberband,
  wrapQtAppsHook,
  cmake,
  qtsvg,
}:

stdenv.mkDerivation rec {
  pname = "samplv1";
  version = "1.3.1";

  src = fetchurl {
    url = "mirror://sourceforge/samplv1/samplv1-${version}.tar.gz";
    hash = "sha256-DcMtNGiMJ9YfTKZLns+3mBKHbkG3Ven3IJAU/qSDyh0=";
  };

  nativeBuildInputs = [
    qttools
    pkg-config
    wrapQtAppsHook
    cmake
  ];

  buildInputs = [
    libjack2
    alsa-lib
    liblo
    libsndfile
    lv2
    qtbase
    rubberband
    qtsvg
  ];

  meta = {
    description = "Old-school all-digital polyphonic sampler synthesizer with stereo fx";
    mainProgram = "samplv1_jack";
    homepage = "http://samplv1.sourceforge.net/";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.linux;
    maintainers = [ ];
  };
}
