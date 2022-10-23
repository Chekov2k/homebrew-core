# NOTE: The version of pstree used on Linux requires
# the /proc file system, which is not available on macOS.

class Pstree < Formula
  desc "Show ps output as a tree"
  homepage "https://github.com/FredHucht/pstree"
  url "https://github.com/FredHucht/pstree/archive/refs/tags/v2.40.tar.gz"
  sha256 "64d613d8f66685b29f13a80e08cddc08616cf3e315a0692cbbf9de0d8aa376b3"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e43ea23b1cc41dbd5717b22c8de73faae3fa58e88a9f18845533e7f4acc24eeb"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "bc1765755ab89e61a17983692eb4ceb6c659f2f90b1f26bfea0ed1a908a7dc07"
    sha256 cellar: :any_skip_relocation, monterey:       "fc23e46dee144842b941ad5b6527018154d38b67827e4f019bf9efab24a15365"
    sha256 cellar: :any_skip_relocation, big_sur:        "bf6f7f6e9a1ec7b0e5454e15973ee091a143eb887c67d81b07f262c447c685b7"
    sha256 cellar: :any_skip_relocation, catalina:       "820b3dd1b26142457348dfc27c29ad8f1b6d86367995d8895ff41d8c74f91c8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d65aff524b410c2ea45556fad2e5b07b9052896c07ee386fc6213208fdc7bc43"
  end

  def install
    system "make", "pstree"
    bin.install "pstree"
    man1.install "pstree.1"
  end

  test do
    lines = shell_output("#{bin}/pstree #{Process.pid}").strip.split("\n")
    assert_match $PROGRAM_NAME, lines[0]
    assert_match "#{bin}/pstree", lines[1]
  end
end
