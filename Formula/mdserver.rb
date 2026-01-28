class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "1.3.0"
  revision "1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.0/mdserver-macos-arm64"
      sha256 "7c44ee5dc5c27ed69111bc2d3df09a23c2d0ba259840cf5d9f790a3fded14b01"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.0/mdserver-macos-amd64"
      sha256 "a02e0421092bf75f0457b2b173b3d15f4961bce634025dab6359fd0ddc3ade1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.0/mdserver-linux-arm64"
      sha256 "cc4e36862a2431848dea82ebd2b4d426d3ac5fdc9be5b50cae40791d3f15c3be"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.0/mdserver-linux-amd64"
      sha256 "a1d15753866fcfa7c1aa657a4ef3ab1c59f72f87433c1ed9fbf474afb2572322"
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
