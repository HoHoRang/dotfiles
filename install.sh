#!/bin/bash

# 1. Homebrew 설치 확인 및 설치
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. 필수 도구 및 폰트 설치
echo "Installing essential tools and fonts..."
brew install stow nvim
brew install --cask font-jetbrains-mono-nerd-font

# 3. Ghostty 터미널 설치 (GUI 앱은 --cask 사용)
if ! brew list --cask ghostty &>/dev/null; then
  echo "Installing Ghostty terminal..."
  brew install --cask ghostty
fi

# 4. Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 5. Powerlevel10k 테마 다운로드
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "Downloading Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# 6. 기존 설정 파일 삭제 (stow 충돌 방지)
echo "Removing existing config files to avoid conflicts..."
# git
rm -rf ~/.gitconfig ~/.gitconfig-aiv ~/.gitignore_global ~/.stCommitMsg
# zsh
rm -rf ~/.zshrc ~/.p10k.zsh
# ghostty
rm -rf ~/.config/ghostty/config
# neovim
rm -rf ~/.config/nvim

# 7. Stow를 사용하여 설정 연결
echo "Applying configurations with Stow..."
cd ~/dotfiles
stow git
stow zsh
stow ghostty
stow nvim

echo "------------------------------------------"
echo "✅ 모든 설치와 설정이 완료되었습니다!"
echo "1. Ghostty를 실행하거나 재시작하세요."
echo "2. 터미널 폰트가 깨진다면 Nerd Font를 설치해야 합니다."
echo "------------------------------------------"
