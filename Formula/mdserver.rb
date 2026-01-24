class Mdserver < Formula
  desc "A lightweight, modern Go replacement for markserv that quickly serves Markdown content as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "v1.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.1.4/mdserver-macos-arm64"
      sha256 "898c05eecaf572f6e403a531d6c759e3cdc2c2e4a09a237b6dc40da068c8222b"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.1.4/mdserver-macos-amd64"
      sha256 "cb476c56c56370fcc57d6235604d40b74eb7d401e9ea3bd87921f4dcb2abd0e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.1.4/mdserver-linux-arm64"
      sha256 "b6db3e6b64540a1c67b4430337bc61d20e1b9a56b2b52a20e0e1257a3710afa6"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.1.4/mdserver-linux-amd64"
      sha256 "1100b1217a446cdbe5935c8cafb25be1c99cdbe8dba80777b5c7ba967483172f"
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
