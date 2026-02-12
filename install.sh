#!/bin/bash

# 1. Homebrew 설치 확인 및 설치
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. 필수 도구 설치
echo "Installing essential tools..."
brew install stow

# 3. Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 4. Powerlevel10k 테마 다운로드
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Downloading Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# 5. 기존 설정 파일 삭제 (stow 충돌 방지)
echo "Removing existing config files to avoid conflicts..."
rm -rf ~/.zshrc ~/.p10k.zsh ~/.gitconfig ~/.gitconfig-aiv ~/.gitignore_global ~/.stCommitMsg

# 6. Stow를 사용하여 설정 연결
echo "Applying configurations with Stow..."
cd ~/dotfiles
stow git
stow zsh

echo "------------------------------------------"
echo "✅ 설치 완료! 터미널을 다시 실행하거나 'source ~/.zshrc'를 입력하세요."
echo "------------------------------------------"
