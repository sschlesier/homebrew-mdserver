class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "2.0.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.1/mdserver-macos-arm64"
      sha256 "c0615799b95a47eef139f925743df16cb38b4944217e1d6b4539c0ca5f6122fc"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.1/mdserver-macos-amd64"
      sha256 "8cd8712496e38d347eb9e75811c8dee6d6c57e5a2137694667754b2ed2041662"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.1/mdserver-linux-arm64"
      sha256 "8ef7606cc022bc18183196b6e8f999d01573ac6ae6ab2c433b0ad5ce41c17a93"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.1/mdserver-linux-amd64"
      sha256 "c7089c291df767691656352f4c1b563da32f1f723d29bac3ee60f481a0328e8e"
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
