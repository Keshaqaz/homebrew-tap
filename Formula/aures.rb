class Aures < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.3.3/aures-0.3.3.tgz"
  sha256 "5285b79b5f1617ff52ad8455491360a1dc09b8c06dcfca2750d072b7733786e7"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"aures").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/src/cli/main.mjs" "$@"
    SH
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aures --version").strip
  end
end
