class Flutter < Formula
  desc "Flutter SDK"
  homepage "https://flutter.dev"
  version "3.3.10"
  url "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_#{version}-stable.tar.xz"
  sha256 "83f19d63fd26e996122f28fa7dcd23525d8ff77a0c5101e026c7dc4d51b6e36b"
  license "BSD-3-Clause"

  def install
    prefix.install Dir.children('.')
  end

  def post_install
    system "chmod", "-R", "u+w", "#{prefix}/bin/cache"
  end

  def caveats
    <<~EOS
      This formula does not install dependencies needed to actually develop. Consider:
        flutter doctor
    EOS
  end

  test do
    system "#{bin}/flutter"
    bin.install_symlink opt_prefix/"bin/flutter"
  end
end
