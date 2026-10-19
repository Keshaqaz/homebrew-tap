class CodexAutoResets < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/ares"
  url "https://github.com/Keshaqaz/ares/releases/download/v0.1.0/codex-auto-resets-0.1.0.tgz"
  sha256 "36ec30f388f29a5ad21ca7eaf45c6a6224a6efd552decba7eda1f17ee82e5ea8"
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
