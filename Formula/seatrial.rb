class Seatrial < Formula
  desc "a declarative but extensible load generation tool for HTTP/1.1 services"
  homepage "https://github.com/dockwa/seatrial"
  url "https://github.com/dockwa/seatrial/archive/v0.1.1.tar.gz"
  sha256 "346a8afa846d80c12cf3103844b53428554bd142309ad87effc80d6122323ef9"
  license "ISC"
  head "https://github.com/dockwa/seatrial.git"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "scdoc" => :build
  depends_on "make" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    system "make", "doc"

    man1.install "manual/seatrial.1"
    man3.install "manual/seatrial.lua.3"
    man5.install "manual/seatrial.5"
  end
end
