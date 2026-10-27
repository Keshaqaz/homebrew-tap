class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.6.0/aures-0.6.0.tgz"
  sha256 "e228684364f9760fa2575c832c3019dbfdcec94565ad49b51385e20ec269fdca"
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
