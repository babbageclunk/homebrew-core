class Juju < Formula
  desc "DevOps management tool"
  homepage "https://jujucharms.com/"
  url "https://launchpad.net/juju/2.3/2.3.2/+download/juju-core_2.3.2.tar.gz"
  sha256 "a2d1cc165f421d25c31a2df1a54d12711353c7afcca339d82587d46f00aab378"

  bottle do
    cellar :any_skip_relocation
    sha256 "6b8b44c5972db0e97312733d998cfffb849d727e4dc5de7896caebd588eebd9a" => :high_sierra
    sha256 "80a4989bafd46baae61568828c672eb03b336c41dbba497e3b1df62631ee05b9" => :sierra
    sha256 "68b4c98f53e8a41c9cd073647d1d80b27de63c03d58a573d990108a9125f5d1b" => :el_capitan
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build", "github.com/juju/juju/cmd/juju"
    system "go", "build", "github.com/juju/juju/cmd/plugins/juju-metadata"
    bin.install "juju", "juju-metadata"
    bash_completion.install "src/github.com/juju/juju/etc/bash_completion.d/juju"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
