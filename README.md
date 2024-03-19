## nixconf

```shell
# update 'flake.lock' file
# first cd into directory
nix flake update

# update system
sudo nixos-rebuild switch --flake [directory name here] [ .#hostname ] # if hostname is diffrent from defined

# update packages (home-manager)
sudo home-manager switch --flake [directory name here] [ .#hostname ] # if hostname is diffrent from defined

```
### Rofi Theme

[collectiion of minmal themes](https://github.com/Murzchnvok/rofi-collection.git)
