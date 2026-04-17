self: super: {
  barracudavpn = super.stdenv.mkDerivation rec {
    pname = "barracudavpn";
    version = "5.3.6"; # Adjust to your deb version

    src = ./barracudavpn.deb; # Path to your deb file

    # Required for extracting deb files
    nativeBuildInputs = [
      super.ar
      super.gnutar
      super.gzip
    ];

    # Runtime dependencies (adjust based on what you found)
    buildInputs = [
      super.stdenv.cc.cc.lib
      super.openssl
      super.curl
      super.libnotify
      # Add more as needed
    ];

    unpackPhase = ''
      ar x $src
      tar -xzf data.tar.gz
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp usr/bin/barracudavpn $out/bin/

      mkdir -p $out/lib
      cp -r usr/lib/* $out/lib/ 2>/dev/null || true

      mkdir -p $out/etc
      cp -r etc/* $out/etc/ 2>/dev/null || true
    '';

    postFixup = ''
      # Update library paths to point to Nix store
      patchelf --set-interpreter ${super.stdenv.cc}/lib64/ld-linux-x86-64.so.2 \
        $out/bin/barracudavpn || true

      patchelf --set-rpath ${
        super.lib.makeLibraryPath [
          super.stdenv.cc.cc.lib
          super.openssl
          super.curl
        ]
      } $out/bin/barracudavpn || true
    '';

    meta = with super.lib; {
      description = "Barracuda VPN client";
      platforms = platforms.linux;
    };
  };
}
