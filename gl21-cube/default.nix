with import <nixpkgs> {}; {
		pet = buildGoModule rec {

			name = "renderer";

			src = ./../.;

			# We don't want to update the SHA everytime the dependencies are updated during development, thus null.
			vendorSha256 = null;

			buildInputs = [ stdenv pkgconfig xorg.libX11.dev xorg.libXcursor.dev xorg.libXrandr.dev xorg.libXinerama.dev xorg.libXi.dev xlibs.libXext.dev libGL.dev xorg.libXxf86vm.dev ];

			subPackages = [ "./gl21-cube/cube.go" ];

			deleteVendor = true;
			runVend = true;
		};
}
