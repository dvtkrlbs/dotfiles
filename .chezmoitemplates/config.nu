use std/util "path add"

$env.config.buffer_editor = "nvim"

$env.config = {
  show_banner: false
  buffer_editor: "nvim"
  ls: {
    use_ls_colors: true
    clickable_links: true
  }

  rm: {
    always_trash: false
  }


  history: {
    max_size: 100_000 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
    isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
  }

  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    partial: true    # set this to false to prevent partial filling of the prompt
    algorithm: "fuzzy"    # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }

  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
  }

  edit_mode: vi
}



$env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
$env.HOMEBREW_CELLAR = "/home/linuxbrew/.linuxbrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/home/linuxbrew/.linuxbrew/Homebrew"

path add "/home/linuxbrew/.linuxbrew/bin"
path add "/home/linuxbrew/.linuxbrew/sbin"

$env.GOPATH = $env.HOME | path join "go"
$env.GOBIN = $env.GOPATH | path join "bin"
$env.GOROOT = $env.HOMEBREW_CELLAR | path join "go/1.23.4/libexec"

path add $env.GOBIN

source ~/.cache/carapace/init.nu

$env.OP_SESSION = ^op signin --raw | str trim


use ~/.cache/starship/init.nu
