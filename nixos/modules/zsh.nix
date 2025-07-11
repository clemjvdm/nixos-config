{pkgs, ...}: 

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    
    shellInit = ''
      export PATH="$HOME/.local/bin:$PATH"
      pfetch
    '';

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };


  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    pfetch
  ];
}
