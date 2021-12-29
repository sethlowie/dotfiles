# DOT FILES!

```bash
bash -c "$(wget https://raw.githubusercontent.com/logiXbomb/dotfiles/master/install.sh -O -)"
```

```bash
bash <(curl -s https://raw.githubusercontent.com/logiXbomb/dotfiles/master/install_mac.sh)
```

# Things to install

#### https://github.com/ogham/exa
> alias ls='exa -l -a --icons -F -a --octal-permissions -h'

This results in a "ls" output that looks like this
![image](https://user-images.githubusercontent.com/11888995/147660234-544d523e-ad34-4d28-92c3-0333e172aa58.png)


#### https://github.com/BurntSushi/ripgrep

Replaces grep. Don't alias this one and just use "rg" alias instead.

#### https://github.com/sharkdp/bat

Like "cat" but with syntax highlighting. Mostly used in vim for previewing files, but still great in the terminal!

#### https://github.com/sharkdp/fd

Replacement for "find"

> Note: on linux the command will be `fdfind` instead of `fd` as fd is already used by another package. Fill free to `alias fd="fdfind"`

#### https://github.com/XAMPPRocky/tokei

For counting LOC in a project. This a a rust solution, another great alternative written in Go is [scc](https://github.com/boyter/scc)
