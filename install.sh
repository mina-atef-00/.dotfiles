#!/usr/bin/env bash

check_git_exists() {
    if ! command -v "git" &>/dev/null; then
        echo "Error: git is not installed"
        echo "Please install git"
        exit 1
    fi
}

clone_dotfiles() {
    trap "handle_clone_err" ERR
    echo "Cloning dotfiles..."
    git clone -q "https://github.com/mina-atef-00/.dotfiles.git" "$HOME/.dotfiles"
}
handle_clone_err() {
    exit "$?"
}

check_sudo_exists() {
    if ! command -v "sudo" &>/dev/null; then
        echo "Please install sudo"
        exit 2
    fi
}
run_sudo_install_scripts() {
    trap "handle_sudo_install_err" ERR
    echo "Running sudo install scripts..."

    sudo_scripts_dir="$HOME/.dotfiles/install-scripts/sudo-install-scripts"
    mapfile -t sudo_scripts < <(find "$sudo_scripts_dir" -maxdepth 1 -type f) #? string to array

    for script in "${sudo_scripts[@]}"; do
        echo "Running $script..."
        run_script_sudo "$script"
    done
}
handle_sudo_install_err() {
    exit "$?"
}
run_script_sudo() {
    sudo /usr/bin/env bash "$1"
}

run_install_scripts() {
    trap "handle_install_err" ERR
    echo "Running install scripts..."

    scripts_dir="$HOME/.dotfiles/install-scripts"
    mapfile -t scripts < <(find "$scripts_dir" -maxdepth 1 -type f) #? string to array

    for script in "${scripts[@]}"; do
        echo "Running $script..."
        run_script "$script"
    done
}
handle_install_err() {
    exit "$?"
}
run_script() {
    /usr/bin/env bash "$1"
}

main() {
    check_git_exists
    clone_dotfiles

    check_sudo_exists
    run_sudo_install_scripts

    run_install_scripts
    
    sudo chsh -s /bin/zsh 
}

main
