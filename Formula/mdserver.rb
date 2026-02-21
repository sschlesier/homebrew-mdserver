class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "1.3.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.2/mdserver-macos-arm64"
      sha256 "7162ff13f77689f6fe07f37afc6a9a651aaa8cf25acb3dab5369fef934d8dd46"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.2/mdserver-macos-amd64"
      sha256 "b3366933cbbd1e602d9e472948ba2d5506e8634850aa858c2a890a117d6178c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.2/mdserver-linux-arm64"
      sha256 "b27cf88a88dd2d48c5cbfd3145179ac99d576ec853695559c19f3d29829b5a4d"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v1.3.2/mdserver-linux-amd64"
      sha256 "d751b8b3fc80e6b6e229999e3e3314e8d71c5411e8a3c7407f6564687b26938c"
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
