require "formula"
require "language/go"
require "open-uri"

class GopadCli < Formula
  desc "Etherpad for markdown with Go - CLI"
  homepage "https://github.com/gopad/gopad-cli"

  head do
    url "https://github.com/gopad/gopad-cli.git", :branch => "master"
    depends_on "go" => :build
  end

  stable do
    url "https://dl.gopad.tech/cli/0.1.0/gopad-cli-0.1.0-darwin-amd64"
    sha256 begin
      open("https://dl.gopad.tech/cli/0.1.0/gopad-cli-0.1.0-darwin-amd64.sha256").read.split(" ").first
    rescue
      nil
    end
    version "0.1.0"
  end

  devel do
    url "https://dl.gopad.tech/cli/testing/gopad-cli-testing-darwin-amd64"
    sha256 begin
      open("https://dl.gopad.tech/cli/testing/gopad-cli-testing-darwin-amd64.sha256").read.split(" ").first
    rescue
      nil
    end
    version "master"
  end

  test do
    system "#{bin}/gopad-cli", "--version"
  end

  def install
    case
    when build.head?
      ENV["GOPATH"] = buildpath
      ENV["GOHOME"] = buildpath
      ENV["CGO_ENABLED"] = 0
      ENV["TAGS"] = ""

      ENV.prepend_create_path "PATH", buildpath / "bin"

      currentpath = buildpath / "gopad-cli"
      currentpath.install Dir["*"]
      Language::Go.stage_deps resources, buildpath / "src"

      cd currentpath do
        system "make", "test", "build"

        bin.install "bin/gopad-cli"
        # bash_completion.install "contrib/bash-completion/_gopad-cli"
        # zsh_completion.install "contrib/zsh-completion/_gopad-cli"
        prefix.install_metafiles
      end
    when build.devel?
      bin.install "#{buildpath}/gopad-cli-testing-darwin-amd64" => "gopad-cli"
    else
      bin.install "#{buildpath}/gopad-cli-0.1.0-darwin-amd64" => "gopad-cli"
    end
  end
end
