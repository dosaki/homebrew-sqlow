class Sqlow < Formula
  @version = "0.0.3"
  desc "A CLI database schema migrator that doesn't care about versions"
  homepage "https://github.com/dosaki/sqlow"
  url "https://github.com/dosaki/sqlow/archive/refs/tags/#{@version}.tar.gz"
  sha256 "818c49e50e205693d507f6d27ea3f98cfa7fb2cbbb28df8f69442b1b1df86747"
  license "Apache Licence, Version 2.0"
  head "https://github.com/dosaki/sqlow"
  
  depends_on "bash" => :build
  depends_on "go" => :build

  @sys_type = "darwin"
  @sys_arch = "arm64"
  on_linux do
    @sys_type = "linux"
  end
  on_intel do
    @sys_arch = "amd64"
  end


  def install
    ENV["GOPATH"] = buildpath
    system "./build.sh", "--default", "--output=#{buildpath}/dist", "--version=#{@version}", "--no-zip"
    bin.install "#{buildpath}/dist/sqlow"
  end

  test do
    system "#{bin}/sqlow", "--version"
  end
end
