class Aures < Formula
  desc "Applies ChatGPT Codex resets from your own GitHub or Google Apps Script worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.5.4/aures-0.5.4.tgz"
  sha256 "c97469873aa2fac8a9685f51d6b400fc3b6118993ddb400d310de75da22b8f7b"
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
