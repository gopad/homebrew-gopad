# frozen_string_literal: true

# Definition of the gopad-api formula
class GopadApi < Formula
  desc "Gopad: API"
  homepage "https://gopad.eu"
  license "Apache-2.0"

  url "https://github.com/gopad/gopad-api/archive/v0.0.0.tar.gz"
  sha256 ""
  head "https://github.com/gopad/gopad-api.git", branch: "master"

  test do
    system bin / "gopad-api", "--version"
  end

  depends_on "go" => :build
  depends_on "go-task" => :build
  depends_on "node@22" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["SHA"] = "undefined"
    ENV["VERSION"] = if build.head?
                       Utils.git_short_head(length: 8)
                     else
                       url.split("/").last.gsub(".tar.gz", "").gsub("v", "")
                     end

    system "task", "fe:install", "fe:generate", "fe:build", "be:generate", "be:build"
    bin.install "bin/gopad-api"

    FileUtils.touch("gopad-api.conf")
    etc.install "gopad-api.conf"
  end

  def post_install
    (var / "gopad-api").mkpath
  end

  service do
    run [opt_bin / "gopad-api", "server"]
    environment_variables GOPAD_API_ENV_FILE: etc / "gopad-api.conf"
    keep_alive true
    log_path var / "log/gopad-api.log"
    error_log_path var / "log/gopad-api.log"
  end
end
