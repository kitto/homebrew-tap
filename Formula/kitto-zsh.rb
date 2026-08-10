class KittoZsh < Formula
  desc "Backpack of zsh helpers for Mac JS development"
  homepage "https://github.com/kitto/kitto-zsh"
  url "https://github.com/kitto/kitto-zsh/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "2608f9865a9bd1136f703b9b2580fc1d9c3de771f9f876a9c19cf3e4f70e20d5"
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
