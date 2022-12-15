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

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];

    shellAliases = {
      v = "nvim";
      c = "cd";
      vrc = "vim ~/.vimrc";

      # Cmake alias
      csg = "cmake -S . -B build";
      cb = "cmake --build build/";

      # Docker alias
      d = "docker";
      dc = "docker compose";
      drm = "docker rm ";
      drmall = "docker rm --force $(docker ps -a -q)";
      dkill = "docker kill ";
      dkillall = "docker kill $(docker ps -a -q)";
      dexec = "docker exec -it";
      dbuild = "docker build";
      drun = "docker run";
      dps = "docker ps";
      dpsa = "docker ps -a";
      dls = "docker container ls";
      dpull = "docker pull";
      dimages = "docker images";

      # GIT  alias 
      gt = "git tag";
      gptags = "git push --follow-tags";

      # Nix  alias 
      npf = "nix profile";
      npfi = "nix profile install";
      ndp = "nix develop";
      hms = "home-manager switch";

      # TC 
      ref = "cd /home/nicolas/Tiger/tc";
      buildenv = "cd /home/nicolas/Tiger/buildenv";
      dtg = "docker run --rm -ti --user 1000 --workdir /tc -v ~/Tiger/tc:/tc registry.lrde.epita.fr/tiger-sid";
      dtc = "docker run --rm -ti --user 1000:users --workdir /tc -v ~/Tiger/tc:/tc registry.lrde.epita.fr/tc-sid";
      assig = "cd /home/nicolas/Tiger/assignments";
    };

    initExtra = ''
      # Autocomplete for various utilities
    '';
  };
}
