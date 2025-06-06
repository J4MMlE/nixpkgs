{
  stdenv,
  lib,
  fetchFromGitHub,
  desktop-file-utils,
  glib,
  gtk4,
  libadwaita,
  libgee,
  libportal-gtk4,
  meson,
  ninja,
  pkg-config,
  python3,
  vala,
  wrapGAppsHook4,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "haguichi";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "ztefn";
    repo = "haguichi";
    tag = finalAttrs.version;
    hash = "sha256-IEcBCiPU9NPrAbTCnONraeVb/Nlq/u4fsEZX+Vd1DiY=";
  };

  postPatch = ''
    patchShebangs meson_post_install.py
  '';

  strictDeps = true;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    python3
    vala
    wrapGAppsHook4
    desktop-file-utils # for update-desktop-database
    glib # for glib-compile-resources
    gtk4 # for gtk-update-icon-cache
  ];

  buildInputs = [
    glib
    gtk4
    libadwaita
    libgee
    libportal-gtk4
  ];

  passthru.updateScript = ./update.sh;

  meta = {
    description = "Graphical frontend for Hamachi on Linux";
    mainProgram = "haguichi";
    homepage = "https://haguichi.net/";
    changelog = "https://haguichi.net/news/release${
      lib.strings.replaceStrings [ "." ] [ "" ] finalAttrs.version
    }";
    license = lib.licenses.gpl3Plus;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ OPNA2608 ];
  };
})
