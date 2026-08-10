class KittoZsh < Formula
  desc "Backpack of zsh helpers for Mac JS development"
  homepage "https://github.com/mattpilott/kitto-zsh"
  url "https://github.com/mattpilott/kitto-zsh/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "93e399f1cc68e5bcac13a36ff516015b04428478f2c38e124f1cc33b262333d9"
  license "MIT"

  def install
    prefix.install "kitto-zsh.plugin.zsh", "functions"
    bin.install "bin/kitto-zsh"
    zsh_completion.install "completions/_kitto-zsh"
  end

  def caveats
    <<~EOS
      Run this once to wire it into ~/.zshrc:
        kitto-zsh init
    EOS
  end

  test do
    system "zsh", "-n", "#{opt_prefix}/kitto-zsh.plugin.zsh"
    assert_match "usage", shell_output("#{bin}/kitto-zsh 2>&1", 1)
  end
end
