class KittoZsh < Formula
  desc "Backpack of zsh helpers for Mac JS development"
  homepage "https://github.com/kitto/kitto-zsh"
  url "https://github.com/kitto/kitto-zsh/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "c3fd4680165c1a52cb5257442637fc27c7d841ae7eed9d1692d87570b8808ed6"
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
