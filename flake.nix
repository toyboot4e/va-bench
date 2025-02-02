{
  # If you're set up with Nix Flakes and `nix-direnv`, run `direnv allow` to get the compiler

  description = "A basic flake with a shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default =
          with pkgs;
          mkShell {
            buildInputs = [
              pkg-config
              stack
              cabal-install
              llvmPackages.bintools
            ];

            packages = [
              (haskell.compiler.ghc984.override { useLLVM = true; })
              # (haskell-language-server.override { supportedGhcVersions = [ "984" ]; })
              haskell.packages.ghc984.cabal-fmt
              # haskell.packages.ghc984.cabal-plan
              # haskell.packages.ghc984.doctest
              # haskell.packages.ghc984.implicit-hie
              # haskellPackages.hoogle
              # haskellPackages.ghcid
              # haskellPackages.ghcide
              # haskellPackages.ghci-dap
              # haskellPackages.haskell-dap
            ];
            # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
          };

        # I'm not good at nix to setup the benchmark
      }
    );
}
