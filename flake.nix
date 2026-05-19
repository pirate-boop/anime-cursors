{
  description = "Коллекция аниме курсоров для NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Экспортируем пакеты (Nix найдет твой FernBLZ здесь)
      packages.${system} = import ./pkgs { inherit pkgs; };

      # Модуль закомментирован, чтобы Nix не ругался на отсутствие папки modules
      # nixosModules.default = import ./modules {
      #   cursorPackages = self.packages.${system};
      # };
    };
}
