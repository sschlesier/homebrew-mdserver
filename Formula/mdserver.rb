class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "1.2.0"
  revision "1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.2.0/mdserver-macos-arm64"
      sha256 "791d540d4b674056403de2aa4ce3d04cdf3c3805204dc59322cbf4fe68e3168e"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.2.0/mdserver-macos-amd64"
      sha256 "3b2b576b7be1ff9fccff45cdb7f98d43db47544001707dc9ced9e040b43c3e6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.2.0/mdserver-linux-arm64"
      sha256 "cdd97d56f79cac0acb6244447d1ccc51c75a5d3b94fcf06ca3a6b49d7b6107b5"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.2.0/mdserver-linux-amd64"
      sha256 "d1ef9be235eec78bec9f9cc6a89c2fed528abde3a63392945de761a1a70deba6"
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
