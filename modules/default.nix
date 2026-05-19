{ cursorPackages }: # Твой флейк сам прокинет сюда self.packages.${system}

{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.anime-cursors;
in {
  options.programs.anime-cursors = {
    enable = mkEnableOption "Включить коллекцию аниме-курсоров";
    
    theme = mkOption {
      type = types.str;
      default = "FernBLZ";
      description = "Имя темы курсора, которую нужно активировать";
    };
  };

  config = mkIf cfg.enable {
    # Добавляем выбранный курсор в систему
    environment.systemPackages = [
      cursorPackages.${cfg.theme}
    ];

    # Выставляем переменные окружения, чтобы Wayland/Hyprland и GTK его сразу подцепили
    environment.variables = {
      XCURSOR_THEME = cfg.theme;
      XCURSOR_SIZE = "24"; 
    };
  };
}
