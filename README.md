Nix flakes for Chicago95 GTK theme

# Installation

Add this repo to your flake inputs

```nix
{
    inputs = {
        ...
        chicago95.url = "github:rice-cracker-dev/chicago95-nix";
    };
}
```

Set `gtk.theme` in home-manager

```
{inputs, pkgs, ...}: {
    gtk.theme = {
        name = "Chicago95";
        package = inputs.chicago95.packages.${pkgs.system}.gtk;
    };
}
```
