{
  description = "Коллекция аниме курсоров для NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Поддерживаем стандартные x86_64 системы (можно расширить)
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # 1. Экспортируем пакеты по отдельности (для nix build)
      packages.${system} = import ./pkgs { inherit pkgs; };

      # 2. Экспортируем наш NixOS-модуль
      nixosModules.default = import ./modules {
        # Передаем наши пакеты внутрь модуля, чтобы он их видел
        cursorPackages = self.packages.${system};
      };
    };
}
