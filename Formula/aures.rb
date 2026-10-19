class Aures < Formula
  desc "Applies issued ChatGPT Codex resets from your own GitHub Actions worker"
  homepage "https://github.com/Keshaqaz/aures"
  url "https://github.com/Keshaqaz/aures/releases/download/v0.4.1/aures-0.4.1.tgz"
  sha256 "dc4d8622ec0eef76471895b2919ff492cbb0eed1c1655a4a595303949321e46c"
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
