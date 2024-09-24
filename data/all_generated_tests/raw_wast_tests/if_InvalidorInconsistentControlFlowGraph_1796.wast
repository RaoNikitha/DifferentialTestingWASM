;; 7. Generate an `if` block with both `then` and `else` blocks containing `br` (branch) instructions that target labels mismatched with their respective nesting levels, leading to CFG inconsistencies.

(assert_invalid
  (module (func $nested-incorrect-branch
    (block (if (result i32)
      (i32.const 1)
      (then (br 1))
      (else (br 2))
    ))
  ))
  "type mismatch"
)