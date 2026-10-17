class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "3.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v3.1.0/mdserver-macos-arm64"
      sha256 "5666c2a16e492e73d45ffb02d79d827ed202bf1970869823f8181b18766b55fb"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v3.1.0/mdserver-macos-amd64"
      sha256 "fab4ad308b8116452252bee785ad8f13df43cf115860414c13029d9a8585860c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v3.1.0/mdserver-linux-arm64"
      sha256 "b168712bae28876caeaf280eefa07cfffea46ee80db983141660b147ffab6f6f"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v3.1.0/mdserver-linux-amd64"
      sha256 "08d5cd059f54994b803d810505f7653727f66c4d31a8d89b0dc5deffd6d932d9"
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
