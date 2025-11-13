FROM archlinux:base-devel

RUN pacman -Syyu --noconfirm git jq pacman-contrib github-cli namcap shellcheck

RUN git clone https://aur.archlinux.org/google-cloud-cli.git && \
    cd google-cloud-cli && \
    env EUID=1 makepkg -si --noconfirm && \
    cd .. && \
    rm -rf google-cloud-cli
