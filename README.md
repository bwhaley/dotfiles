# Dotfiles

This repo contains a collection of tools and configs that Ben has found useful when working with AWS and IaC. Feel free to contribute your own favorites!

## The Basics

You probably already know about and use these, but I don’t want to make any assumptions.

- Homebrew
- iTerm2
- Spotify (very important)
- Docker

## Power tools

Tools to make the every day Macos experience a bit better.

- Flycut - A better clipboard.
  - In the settings I like to enable “Launch Flycut on login” and I update the hotkey to Shift+Cmd+v

- Moom - Better window management.

- Gitako - Browser plugin. Enables a file tree browser on GitHub with search and other features.

## CLI tools

CLI tools to impress your date.

- Zsh
  - This is now default in Macos, but I still install with Homebrew in order to get the newest version.
  - `brew install zsh`
  - `chsh -s /opt/homebrew/bin/zsh`

- oh-my-zsh

  - I also set the following plugins:
```
  plugins=(
    git
    dotenv
    macos
    aws
    asdf
  )
```

- gpg - `brew install gpg`
  - After this, complete [the GPG signature setup for GitHub](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).

- `asdf` - CLI tool runtime management. Manage multiple versions of most common CLI tools, like go, python, terraform, etc. Alternative to individual version managers like pyenv, tfenv, gvm, etc.

- awscli
  - `brew install awscli`

- pipx - Isolated Python environments without activating a virtualenv

- `aws-okta-processor` - Auth to AWS via Okta through the CLI.
  - pipx install aws-okta-processor

- `gojq` - Replacement for jq which appears to no longer be maintained.

- `ripgrep` - (much) Faster grep.

- `fzf` - Fuzzy finder for the CLI.
  - Amazing when paired with reverse history search (ctrl+r on the shell), when searching for files, etc.

- `kubectx` and `kubens` - Easily switch k8s contexts and namespaces. Especially when paired with autocompletion.

- broot - Better file and directory navigator.
  - `brew install broot`
  - Install font for icons: https://dystroy.org/broot/icons/

- deno - A modern runtime for JavaScript and TypeScript.
  - `brew install deno`

- node 
  - `asdf install nodejs latest`

- terraform
  - Install latest using asdf
  - Install < 1.0.2 manually:
    - Example:
    - `curl -L 'https://github.com/hashicorp/terraform/archive/v0.14.11.tar.gz' | tar -xzf-`
    - `GOARCH=amd64 go build -o ~/terraform`
    - `md ~/.asdf/installs/terraform/0.14.11/bin`
    - `mv ~/terraform ~/.asdf/installs/terraform/0.14.11/bin`
    - `asdf reshim terraform 0.14.11`





## Vim

Check out `.vimrc` for the configuration. Here are a few notes.

1. Install vim with `asdf` to replace Macos system vim which doesn't include some nice features.
  1. `asdf install vim latest`
  1. `asdf global vim latest`
1. Install [`vim-plug`](https://github.com/junegunn/vim-plug)

