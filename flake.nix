{
	description = "Fish context-aware abbr generator";

	inputs = {
		flake-parts = { type="github"; owner="hercules-ci"; repo="flake-parts"; };
		nixpkgs = { type="github"; owner="NixOS"; repo="nixpkgs"; ref="nixpkgs-unstable"; };
		fish-helpText = {
			type="github"; owner="Drazape"; repo="fish-helpText";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-parts.follows = "flake-parts";
			};
		};
		fish-format = {
			type="github"; owner="Drazape"; repo="fish-format";
			inputs = {
				nixpkgs.follows = "nixpkgs";
				flake-parts.follows = "flake-parts";
			};
		};
	};

	outputs = inputs@{ flake-parts, ... }:
		flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
			perSystem = { self', inputs', pkgs, lib, system, ... }: {
				packages = let pkgName = "fish-subAbbr"; in {
					default = self'.packages.${pkgName};
					${pkgName} = pkgs.stdenvNoCC.mkDerivation {
						name = pkgName;
						inherit system;
						src = ./.;
						installPhase = ''${lib.meta.getExe pkgs.fish} --no-config --private -- ${./install.fish} ${./.}'';
						fixupPhase = ''
							substituteInPlace $out/share/fish/vendor_functions.d/sub-abbr.fish --replace-fail \
								PATHS-TO-DEPENDENCY-FUNCTIONS '{${inputs'.fish-helpText.packages.default},${inputs'.fish-format.packages.default}}/share/fish/vendor_functions.d'
							substituteInPlace $out/share/fish/vendor_functions.d/sub-abbr.fish --replace-fail \
								'/dev/null # shell-startup directories' ${inputs'.fish-format.packages.default}/share/fish/vendor_conf.d
						'';
					};
				};
				devShells.default = pkgs.mkShellNoCC { # use with fish-nixenv
					FISH_NIXPKG = self'.packages.default;
					FISH_DIRENV_HOOKS = pkgs.writers.writeFish "reload-packages" ''
						set --global -- _fish_plugin_remover _sub-abbr_hook_reload
						function {$_fish_plugin_remover} --description='Re-initiate the environment state based on the function path'
							# use variables instead of command substitution until https://github.com/fish-shell/fish-shell/issues/12996 is resolved
							set --local -- subabbr_identifiers (sub-abbr identity list)
							sub-abbr identity erase {$subabbr_identifiers}
							sub-abbrs
						end
						$_fish_plugin_remover # same function for both exit and enter
					'';
				}; 
			};
		};
}
