class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "2.0.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.0/mdserver-macos-arm64"
      sha256 "e88bd830de6b175b08bd28f9ad8b362e40d92f219cfe0cf1edf66fe389e9070d"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.0/mdserver-macos-amd64"
      sha256 "60e92fcd1b996e313eb92ba146ed1f2e0619a11fa3cc8e13b7961f1dde329c8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.0/mdserver-linux-arm64"
      sha256 "eb064870add770df6ac5977219f8d8ec55010de5a515fdcc30f8f62f0c616267"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.0.0/mdserver-linux-amd64"
      sha256 "776082de4432a5f67e82e789e6d096000bb8b4f34ffc6185f4166b724ad10565"
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
