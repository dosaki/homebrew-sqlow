class Sqlow < Formula
  @@version = "0.0.6"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "2ff7ca73e3e4f1090b9b79f3f3d8b698bae7e5e4a402518c17e7b00cb73bbe05"
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
