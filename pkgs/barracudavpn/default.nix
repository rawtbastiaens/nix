{ stdenv, lib, dpkg, ar, gzip, coreutils }:

stdenv.mkDerivation rec {
  pname = "barracudavpn";
  version = "5.3.6";

  src = ./barracudavpn_5.3.6_amd64.deb;

  nativeBuildInputs = [ dpkg ar gzip coreutils ];

  unpackPhase = ''
    ar x $src
    tar xzf data.tar.gz
  '';

  installPhase = ''
    cp -r . $out
  '';

  meta = with lib; {
    description = "Barracuda VPN client";
    homepage = "https://barracuda.com/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
