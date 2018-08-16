# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ucc < Formula
  desc "The Unified Code Counter (UCC) is a comprehensive software lines of code counter produced by the USC Center for Systems and Software Engineering."
  homepage "http://csse.usc.edu/ucc_new/wordpress/"
  url "https://bitbucket.org/dknow/ucc/get/3ef04df20760.zip"
  version "2015.12.6"
  sha256 "99ba48c61c639f187876afb0b96c880cd8c5e37d3865fbc053ea61757b05645f"

  depends_on "boost" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "make", "-f", "Makefile.mac", "prefix=#{prefix}", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test UCC`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "UCC"
  end
end
