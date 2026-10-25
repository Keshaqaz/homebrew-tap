class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own GitHub or Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.5.7/aures-0.5.7.tgz"
  sha256 "2eb66b198e40bc5644e970c867ba20b5be25b7dafeaec4adca4e6645bd7b76e9"
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
