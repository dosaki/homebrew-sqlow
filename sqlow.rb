class Sqlow < Formula
  @@version = "0.1.3"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@@version}.tar.gz"
  sha256 "c8fe6042e33ede9886636abfe56da1db5c4a9144fec4168fd426906cf39e0853"
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
