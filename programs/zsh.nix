{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colorize" "colored-man-pages" "docker" "systemd" ];
      theme = "agnoster";
    };

    shellAliases = {
      v = "vim";
      c = "cd";
      d = "cd";
      vrc = "vim ~/.vimrc";

      # Cmake alias 
      csg = "cmake -S . -B build";
      cb = "cmake --build build/";

      # GIT  alias 
      gt = "git tag";
      gptags = "git push --follow-tags";

      # Nix  alias 
      npf = "nix profile";
      npfi = "nix profile install";
      ndp = "nix develop";
    };
  };
}
