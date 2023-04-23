class Sqlow < Formula
  @@version = "0.0.9"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "a8ed64874395dcd04da982ed36dcc72689ec24e1aedd1b8e12027cd722bd2310"
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
