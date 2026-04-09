{ stdenv, lib, dpkg, binutils, findutils, gzip }:

stdenv.mkDerivation rec {
  pname = "barracudavpn";
  version = "5.3.6";

  src = ./barracudavpn_5.3.6_amd64.deb;

  nativeBuildInputs = [ dpkg binutils findutils gzip ];

  unpackPhase = ''
    ar x $src
    tar xzf data.tar.gz
  '';

  installPhase = ''
    mkdir -p $out
    cp -r usr/bin $out/ 2>/dev/null || true
    cp -r usr/lib $out/ 2>/dev/null || true
    cp -r etc $out/ 2>/dev/null || true
    cp -r opt $out/ 2>/dev/null || true
  '';

  meta = with lib; {
    description = "Barracuda VPN client";
    homepage = "https://barracuda.com/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
