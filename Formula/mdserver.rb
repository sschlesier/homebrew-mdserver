class Mdserver < Formula
  desc "A lightweight, modern Go replacement for markserv that quickly serves Markdown content as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "v1.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/1.1.3/mdserver-macos-arm64"
      sha256 "b1f21181e8d0e731ee90e8e92789dc8b3c83aa8c7a9f92e934ffbdc7bb7ca912"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/1.1.3/mdserver-macos-amd64"
      sha256 "cb311d9f16fe981715b685d0a2f531101df36f75ce350aa5dc7af95a2714ac73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/1.1.3/mdserver-linux-arm64"
      sha256 "69bcb04685ac1c2cbc1998a11ee48bac3559464d0878689c40662f7541ba29b0"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/1.1.3/mdserver-linux-amd64"
      sha256 "0627312a0ad537e85d734b9b5492063c2dc4cab18090ba7f0e9e38e3c8a04497"
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
