{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "krew";
  version = "0.5.0";

  src = fetchTarball {
    url = "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz";
    sha256 = "sha256:0909da6bv72v9n2q6b9xyifpv2fylmsdd2f2i42bgf32zsiih3cx";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/krew-linux_amd64 $out/bin/
    # ./krew-linux_amd64 install crew
  '';
}
