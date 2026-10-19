class CodexAutoResets < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/ares"
  url "https://github.com/Keshaqaz/ares/releases/download/v0.2.1/codex-auto-resets-0.2.1.tgz"
  sha256 "e57c3353acd5b03ff735fe5d7fcddf2770dd469315a3ca0eb55f67c1c4dbbf12"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"codex-auto-resets").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/src/cli/main.mjs" "$@"
    SH
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/codex-auto-resets --version").strip
  end
end
