class Sqlow < Formula
  @@version = "0.0.5"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "4c657bd27b672f2c7b2b1d9ccb6478eec2d77d1fe1c283d250fb2510b1dbe7a6"
  license "Apache Licence, Version 2.0"
  head "https://github.com/dosaki/sqlow"
  
  depends_on "bash" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "./build.sh", "--default", "--output=#{buildpath}/dist", "--version=#{@@version}", "--no-zip"
    bin.install "#{buildpath}/dist/sqlow"
  end

  test do
    system "#{bin}/sqlow", "--version"
  end
end
