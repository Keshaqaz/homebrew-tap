class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own GitHub or Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.5.5/aures-0.5.5.tgz"
  sha256 "74834830a944e02d862c6706fc361947878d40dd933e0d95d6127b4ce23a8794"
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
