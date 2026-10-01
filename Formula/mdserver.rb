class Mdserver < Formula
  desc "Lightweight Go replacement for markserv, quickly serves Markdown as HTML"
  homepage "https://github.com/sschlesier/mdserver"
  version "2.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.1.0/mdserver-macos-arm64"
      sha256 "8fdfd1b695ba382bf4d099ee8177055beb3d20f64d8f8bc658ba174b15c7498e"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.1.0/mdserver-macos-amd64"
      sha256 "f50b835a4048d130d648d5025e2276ea9e8dcd9b42f3e147eac7ccf2bcb321bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/mdserver/releases/download/v2.1.0/mdserver-linux-arm64"
      sha256 "218cc3765646c8be51bcab35fc6ccbb27ed3d353e2057e16614387e97b6cb774"
    else
      url "https://github.com/sschlesier/mdserver/releases/download/v2.1.0/mdserver-linux-amd64"
      sha256 "5e698af71ead6201d3a48e8bb253632b2ae1a950809b837f2a9b822b7699507d"
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
