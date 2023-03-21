# frozen_string_literal: true

# Definition of the gopad-ui formula
class GopadUi < Formula
  desc "Gopad: UI"
  homepage "https://gopad.eu"
  license "Apache-2.0"

  url "https://github.com/gopad/gopad-ui/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gopad/gopad-ui.git", branch: "master"

  test do
    system bin / "gopad-ui", "--version"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["SHA"] = "undefined"
    ENV["VERSION"] = if build.head?
                       Utils.git_short_head(length: 8)
                     else
                       url.split("/").last.gsub(".tar.gz", "").gsub("v", "")
                     end

    system "make", "generate", "build"
    bin.install "bin/gopad-ui"

    FileUtils.touch("gopad-ui.conf")
    etc.install "gopad-ui.conf"
  end

  def post_install
    (var / "gopad-ui").mkpath
  end

  service do
    run [opt_bin / "gopad-ui", "server"]
    environment_variables GOPAD_UI_ENV_FILE: etc / "gopad-ui.conf"
    keep_alive true
    log_path var / "log/gopad-ui.log"
    error_log_path var / "log/gopad-ui.log"
  end
end
