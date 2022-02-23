class Seatrial < Formula
  desc "a declarative but extensible load generation tool for HTTP/1.1 services"
  homepage "https://github.com/dockwa/seatrial"
  url "https://github.com/dockwa/seatrial/archive/v0.1.0.tar.gz"
  sha256 "106c1203243e50dae5e0979c7b4218f929eb4ab6375815a924793d7aa18dc4bd"
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
