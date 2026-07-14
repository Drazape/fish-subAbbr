{
  description = "Fish context-aware abbr generater";

  inputs = {
    flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
    nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          default = self'.packages.fish-subAbbr;
          fish-subAbbr = builtins.derivation {
            name = "fish-subAbbr";
            inherit system;
            builder = pkgs.lib.getExe pkgs.fish;
            args = [ "--no-config" "--private" "--" ./install.fish ./. ];

            HOME = "/tmp/"; # Temporary home directory to write history to
            PATH = pkgs.coreutils+"/bin";
          };
        };
      };
    };
}
