# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -s "${HOME}/google-cloud-sdk/path.zsh.inc" ]]; then
  source "${HOME}/google-cloud-sdk/path.zsh.inc"
  source "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

if [ -e /home/ppetru/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ppetru/.nix-profile/etc/profile.d/nix.sh; fi

HISTSIZE=1000000
SAVEHIST=1000000

eval `dircolors ~/.dircolors`
