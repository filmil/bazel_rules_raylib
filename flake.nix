{
  description = "C++ environment using Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

      in
      {
        devShells.default = with pkgs; (mkShell.override { stdenv = gcc14Stdenv; }) {
          name = "flake-example-shell";
          packages = [
            expat
            glew
            glfw
            glibc
            libGL
            libGLU
            libdrm
            llvm_18
            mesa
            nix
            pax-utils
            waylandpp
            xorg.libX11
            xorg.libX11.dev
            xorg.libXft
            xorg.libXext
            xorg.libXinerama
            xorg.libxcb
            xorg.libXau
            xorg.libXdmcp
            xorg.libpciaccess
            zip
          ];
        };
      });
}

