;; 10. **Test 10**: Construct a scenario where an `if` block's context extension (`C'`) improperly propagated, leading to stack size expansion mismatches. This should create conditions for operand stack corruption by incorrectly handling `else` branches that do not adequately match outer operand expectations.

(assert_invalid
  (module (func $c-extension-mismatch (result i32)
    (if (result i32)
      (i32.const 1)
      (then (i32.const 0) (i32.const 0) (drop))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)