# frozen_string_literal: true

# Definition of the gopad-cli formula
class GopadCli < Formula
  desc "Gopad: CLI"
  homepage "https://gopad.eu"
  license "Apache-2.0"

  url "https://github.com/gopad/gopad-cli/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gopad/gopad-cli.git", branch: "master"

  test do
    system bin / "gopad-cli", "--version"
  end

  depends_on "go" => :build
  depends_on "go-task" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["SHA"] = "undefined"
    ENV["VERSION"] = if build.head?
                       Utils.git_short_head(length: 8)
                     else
                       url.split("/").last.gsub(".tar.gz", "").gsub("v", "")
                     end

    system "task", "generate", "build"
    bin.install "bin/gopad-cli"
  end
end
