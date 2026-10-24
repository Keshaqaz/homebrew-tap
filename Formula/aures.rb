class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own GitHub or Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.5.1/aures-0.5.1.tgz"
  sha256 "0af888ed90020ec71be2151f3df4092557a4d7d372dda7ae600a0b6bc5ef0c05"
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
