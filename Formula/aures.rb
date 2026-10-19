class Aures < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.4.0/aures-0.4.0.tgz"
  sha256 "78c7d31a2910ca9ab23c4f41612130e0afdb928eedefadcfdec87c940095c796"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"aures").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/src/cli/main.ts" "$@"
    SH
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aures --version").strip
  end
end
