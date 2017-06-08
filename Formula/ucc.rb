# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ucc < Formula
  desc "The Unified Code Counter (UCC) is a comprehensive software lines of code counter produced by the USC Center for Systems and Software Engineering."
  homepage "http://csse.usc.edu/ucc_new/wordpress/"
  url "https://fb.gdr.name/dknow-ucc-bdf93953ceb5.zip"
  version "2015.12"
  sha256 "ba39e97ae2892c9e94dde016cb702e834dcfb67028588a2dadd18d8ffbd2296b"

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
