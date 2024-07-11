# typed: true
# selective-apply-code-action: refactor.extract
# enable-experimental-lsp-extract-to-variable: true

def rescue_1
  begin
    puts "a"
  rescue Errno::ENOENT
    2 + 22
  rescue ArgumentError
    3 + 22
  else
    4 + 22
  ensure
    5 + 22
  #     ^^ apply-code-action: [A] Extract Variable (this occurrence only)
  #     ^^ apply-code-action: [B] Extract Variable (all 4 occurrences)
  end
end

def rescue_1
  begin
  rescue Errno::ENOENT
    2 + 22
    2 + 22
    2 + 22
  # ^^^^^^ apply-code-action: [C] Extract Variable (this occurrence only)
  # ^^^^^^ apply-code-action: [D] Extract Variable (all 3 occurrences)
  rescue ArgumentError
    3 + 22
  else
    4 + 22
  ensure
    5 + 22
  end
end
