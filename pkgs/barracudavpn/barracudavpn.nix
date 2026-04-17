{
  stdenv,
  lib,
  dpkg,
  binutils,
  findutils,
  gzip,
  zstd,
}:

stdenv.mkDerivation rec {
  pname = "barracudavpn";
  version = "5.3.6";

  src = ./barracudavpn_5.3.6_amd64.deb;

  nativeBuildInputs = [
    dpkg
    binutils
    findutils
    gzip
    zstd
  ];

  unpackPhase = ''
    ar x $src
    tar xf data.tar.zst
  '';

  installPhase = ''
    mkdir -p $out
    cp -r usr/local/bin $out/ 2>/dev/null || true
  '';

  meta = with lib; {
    description = "Barracuda VPN client";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
