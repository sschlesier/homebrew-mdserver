class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "2.0.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.2/mdserver-macos-arm64"
      sha256 "b5ff89b735f65fb7104e20bb7bd50c01c004142727ea5605f568edd680c034b5"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.2/mdserver-macos-amd64"
      sha256 "3ea81a4923d05fae90a01b5ec2b73dbafb7d44fb048a1706d623dbd5791b910e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.2/mdserver-linux-arm64"
      sha256 "3aa576ecbe65105d1cbf179b2cbadb904080e5f3ba9a75bf3a6b47e656480fda"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.2/mdserver-linux-amd64"
      sha256 "ad8f65c018d038446d86be70ae3cac4707295c8e469caff808ba231e370266a4"
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
