class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.6.1/aures-0.6.1.tgz"
  sha256 "4722335a9fa824513ab29dd5cd83f08a63c13a7c7d5aaa23385c57e95edef1f6"
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
