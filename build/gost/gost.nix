{ stdenv, lib, fetchurl, gzip }:
# https://www.youtube.com/watch?v=CqFcl4BmbN4

stdenv.mkDerivation rec {
  name = "gost";
  version = "3.0.0";

  src = fetchurl {
    url = "https://github.com/go-gost/gost/releases/download/v${version}/${name}_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-e3TmeYctFDHaFS1d9LMZL2YK9UwJMLuN4pbRDVYDhj0=";
  };

  dontBuild = true;
  buildInputs = [ gzip ];

  unpackPhase = ''
    mkdir $name
    tar xzf $src -C $name
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ${name}/${name} $out/bin/${name}
    chmod +x $out/bin/${name}
  '';

  meta = with lib; {
    description = "GO Simple Tunnel - a simple tunnel written in golang";
    homepage = https://github.com/go-gost/gost;
    license = licenses.mit;
    maintainers = with stdenv.lib.maintainers; [ ];
    platforms = [ "x86_64-linux" ];
  };
}
