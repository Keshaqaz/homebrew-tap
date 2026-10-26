class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own GitHub or Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.5.8/aures-0.5.8.tgz"
  sha256 "c1aea8789e3e948c99378be33571bed5bd3f8c118f198b5ae62f0bea29af6214"
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
