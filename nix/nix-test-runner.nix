let
  flakeLock = builtins.fromJSON (builtins.readFile ../flake.lock);
  src = builtins.fetchTree flakeLock.nodes.nix-test-runner.locked;
in
{ pkgs ? import ./nixpkgs.nix { }
  # Use last pinned crate2nix packages to build the test runner
  # so that it works even if we have broken stuff!
, tools ? pkgs.callPackage ../tools.nix { }
}:
let
  nixTestRunner = tools.appliedCargoNix {
    name = "nix-test-runner";
    inherit src;
  };
in
nixTestRunner.rootCrate.build
