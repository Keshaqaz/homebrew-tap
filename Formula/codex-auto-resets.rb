class CodexAutoResets < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/ares"
  url "https://github.com/Keshaqaz/ares/releases/download/v0.2.2/codex-auto-resets-0.2.2.tgz"
  sha256 "d5a7c79aa8710e1e859d46d6a986ec7c383f643a185c9a43e2aa49698eff4eee"
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
