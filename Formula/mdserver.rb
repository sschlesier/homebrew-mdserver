class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "1.3.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.1/mdserver-macos-arm64"
      sha256 "a58347bde8f7f57f3984514062804265a4357e57753daac2753166434e0f3a6a"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.1/mdserver-macos-amd64"
      sha256 "cb49e55baa9dd0f54ae473bcd0fd5a15da8fe998a98493cb5e0a03df53bfcc0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.1/mdserver-linux-arm64"
      sha256 "ac51bf37677f79e9b0771b96c3f5abb521ebd178c3ff3eb8134b8ac1e8eef0b7"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.1/mdserver-linux-amd64"
      sha256 "8aad5283f569d677947a84ab2e8ec7d47dc9d1634696153345c85135372a6dc8"
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
