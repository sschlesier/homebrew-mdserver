# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mdserver < Formula
  desc "local server for markdown files"
  homepage "https://github.com/sschlesier/mdserver"
  url "https://github.com/sschlesier/mdserver/releases/download/v1.0.0/mdserver-macos-arm64"
  sha256 "587c9ef4ccd4b469802cdfde7d265c4b8d659996f1e0425db63357d7c2a24d08"
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
    assert_match "v1.0.0", shell_output("#{bin}/mdserver --version")
  end
end
