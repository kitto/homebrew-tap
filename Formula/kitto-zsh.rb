class KittoZsh < Formula
  desc "Backpack of zsh helpers for Mac JS development"
  homepage "https://github.com/kitto/kitto-zsh"
  url "https://github.com/kitto/kitto-zsh/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "c7909c9977066ba2493d7df05169c5b98ccfe7b53242b56070ff47a7ebddaced"
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
