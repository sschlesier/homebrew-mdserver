# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mdserver < Formula
  desc "local server for markdown files"
  homepage "https://github.com/sschlesier/mdserver"
  url "https://github.com/sschlesier/mdserver/releases/download/v1.1.0/mdserver-macos-arm64"
  sha256 "141c278161a2e29b9745eaad29aa46c4998bf82134136f62d73e76d092170820"
  license "MIT"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    bin.install "mdserver-macos-arm64" => "mdserver"
  end

  test do
    assert_match "v1.1.0", shell_output("#{bin}/mdserver --version")
  end
end
