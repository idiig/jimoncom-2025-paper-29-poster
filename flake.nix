{
  description = "Dev environment for jinmoncom 2025 paper 29 poster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = f:
        nixpkgs.lib.genAttrs allSystems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });

    in {
      devShells = forAllSystems ({ pkgs }: {
        default = let
          tex = pkgs.texlive.combine {
            inherit (pkgs.texlive)
              scheme-basic  # basic scheme
              latexmk       # for automatic compilation
              luatex85      # for LuaLaTeX support
              luatexja      # for LuaLaTeX Japanese support
              standalone    # for standalone document class
              fontspec      # Font selection
              pgf           # tikz package
              pgfplots      # plotting package
              haranoaji     # Japanese font
              pxrubrica     # Japanese ruby annotation
              # Commonly used packages
              amsmath
              amscls
              tools
              graphics
              geometry
              cleveref
              url
              hyperref
              ulem
              svg
              transparent
              catchfile
              # additional
              blkarray
              booktabs
              multirow
              filehook
              svn-prov
              tikzmark
            ;
          };
        in
          pkgs.mkShell {
            packages = [ tex pkgs.pdf2svg ];
            
            shellHook = ''
              
              echo ""
              echo "Available commands:"
              echo "  latexmk main.tex"
              echo ""
            '';
          };
      });
    };
}
