class Aures < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.3.0/aures-0.3.0.tgz"
  sha256 "668fb449712fb9cfecd7648766d93e2a8fb435eecfafa90e90e94668f676b497"
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
