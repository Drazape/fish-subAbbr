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
					${pkgName} = builtins.derivation {
						name = pkgName;
						inherit system;
						builder = pkgs.lib.getExe pkgs.fish;
						args = [ "--no-config" "--private" "--" ./install.fish ./. ];

						HOME = "/tmp/"; # Temporary home directory to write history to
						PATH = pkgs.coreutils+"/bin";
					};
				};
				devShells = {
					default = self'.devShells.pkg;
					pkg = pkgs.mkShellNoCC {
						shellHook = ''exec ${lib.meta.getExe pkgs.fish} --init-command='
							functions --erase -- sub-abbr sub-abbrs (functions --all | string match --entire --regex -- ^_sub-abbr_) (functions --all | string match --entire --regex -- ^__sub_2D_abbr__expand_)
							for script in ${self'.packages.default}/share/fish/*/*.fish
								source {$script}
							end
							sub-abbr identity erase (sub-abbr identity list)'
						'';
					};
					# Also a shell that directly sources the scripts in the current directory
				};
			};
		};
}
