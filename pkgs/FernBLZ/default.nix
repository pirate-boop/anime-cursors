{ stdenv }:

stdenv.mkDerivation rec {
  pname = "FernBLZ";
  version = "1.0";

  # Берём исходники из текущей папки
  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    # Создаем системный путь для темы курсоров
    mkdir -p $out/share/icons/${pname}

    # Копируем строго нужные файлы и папки.
    # Папку preview и файл default.nix сюда НЕ пишем, 
    # чтобы они не засоряли системный раздел /nix/store
    cp -r index.theme cursors $out/share/icons/${pname}/
  '';
}
