class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "3.0.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v3.0.0/mdserver-macos-arm64"
      sha256 "18a68bce7bfae810a48e7d7199fe68ea873eefc0b80ad267ec9fe640094dabc4"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v3.0.0/mdserver-macos-amd64"
      sha256 "eb5d7aba43d435a5059b320b4cd93953727c2e6ced560908541897b2550a89fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v3.0.0/mdserver-linux-arm64"
      sha256 "287eb4e260b9a89df40c7ff0ffe67eecd9688a547d47887f92b78ab8923b5252"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v3.0.0/mdserver-linux-amd64"
      sha256 "53776c841f895cfe13a8793988d27423cf52aa3ebbcdfceb44287b76f5a87d67"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "mdserver-macos-arm64" : "mdserver-macos-amd64"
    else
      Hardware::CPU.arm? ? "mdserver-linux-arm64" : "mdserver-linux-amd64"
    end

    bin.install binary_name => "mdserver"
  end

  test do
    system "#{bin}/mdserver", "--version"
  end
end
