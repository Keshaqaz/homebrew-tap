class CodexAutoResets < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/ares"
  url "https://github.com/Keshaqaz/ares/releases/download/v0.2.0/codex-auto-resets-0.2.0.tgz"
  sha256 "bcc36f7ba8fdf99143b90d7e0d5ff05e541b9c1559e62be1632fa19077a1b266"
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
