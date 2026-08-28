{
	description = "Fish context-aware abbr generator";

	inputs = {
		flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
	};

	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
			perSystem = { self', pkgs, lib, system, ... }: {
				packages = let pkgName = "fish-subAbbr"; in {
					default = self'.packages.${pkgName};
					${pkgName} = pkgs.stdenvNoCC.mkDerivation {
						name = pkgName;
						inherit system;
						src = ./.;
						installPhase = ''${lib.meta.getExe pkgs.fish} --no-config --private -- ${./install.fish} ${./.}'';
					};
				};
				devShells.default = pkgs.mkShellNoCC {
					shellHook = ''exec ${lib.meta.getExe pkgs.fish} --init-command=source\ ''+pkgs.writers.writeFish "prepend-script-paths" ''
						set --prepend -- fish_function_path ${self'.packages.default}/share/fish/vendor_functions.d
						set --prepend -- fish_complete_path ${self'.packages.default}/share/fish/vendor_completions.d
					'';
				};
			};
		};
}
