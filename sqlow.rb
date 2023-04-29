class Sqlow < Formula
  @@version = "0.1.1"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "9b94f57c37b336cbc4de149f92237dd46d33d701df224175681e80daa1fd94b9"
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
