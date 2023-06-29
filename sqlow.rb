class Sqlow < Formula
  @@version = "0.1.2"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "a3021185f510c85b6dc2e5ff97aa9346543369b228477a774b02c80ad1551e3a"
  license "Apache Licence, Version 2.0"
  head "https://github.com/dosaki/sqlow"
  
  depends_on "bash" => :build
  depends_on "go" => :build

  def install
    system "./build.sh", "--default", "--output=./dist", "--version=#{@@version}", "--no-zip"
    bin.install "./dist/sqlow"
  end

  test do
    system "#{bin}/sqlow", "--version"
  end
end
