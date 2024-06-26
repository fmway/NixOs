{ pkgs, ... }:
{
  isNormalUser = true;
  description = "fmway";
  home = "/home/fmway";
  extraGroups = ["networkmanager" "docker" "wheel" "video" "gdm" "dialout" "kvm" "adbusers"];
  packages = with pkgs; [
    custom.bootstrap-studio
    gnome-extension-manager
    gnome.dconf-editor
    gnome.gnome-tweaks
    foliate
    # youtube-music
    # Google chrome with wayland support
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=VaapiVideoDecodeLinuxGL,TouchpadOverscrollHistoryNavigation"
        "--use-gl=angle"
        "--use-angle=gl"
        "--ozone-platform=wayland"
      ];
    })

    zoom-us
    discord
    telegram-desktop
    libreoffice-fresh
    zotero-beta
    anytype
    kdenlive
    mpv

    rustup
    zls
    zig
    deno
    bun

    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
     })
  ] ++ (with pkgs.gnomeExtensions; [
    paperwm
    appindicator
    clipboard-indicator
    thinkpad-battery-threshold
    blur-my-shell
    net-speed
    totp
    cloudflare-warp-toggle
    system-monitor
    weather-oclock
  ]);
  shell = pkgs.fish;
}
