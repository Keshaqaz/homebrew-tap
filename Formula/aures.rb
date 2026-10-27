class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.6.2/aures-0.6.2.tgz"
  sha256 "95b60efcfcdf0ba3ffb89d175d5ced330518a8ef6cf57d0702a14fa7403a1a66"
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
