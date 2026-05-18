{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "Neon-Genesis-Evangelion";
  version = "1.0";

  src = fetchurl {
    url = "https://ссылка-на-прямое-скачивание-архива/eva-cursor.tar.gz";
    sha256 = "0000000000000000000000000000000000000000000000000000000000000000"; # Гитхаб/Nix подскажет правильный хэш
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/icons/${pname}
    # Распаковываем содержимое архива прямо в папку иконки
    cp -r . $out/share/icons/${pname}/
  '';
}
