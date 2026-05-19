{ pkgs }:

{
  # Вызываем деривацию из папки FernBLZ
  FernBLZ = pkgs.callPackage ./FernBLZ { };
}
