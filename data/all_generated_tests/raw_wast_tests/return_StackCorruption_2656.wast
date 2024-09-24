;; 5. **Test 5: Ignored Intermediate Stack Values**    - Return from a block after pushing excess values that should be ignored post-`return`. The test validates if intermediate stack values wrongly affect subsequent instructions.    - *Related Constraint*: Ensures intermediate values are discarded properly up to outermost block.

(assert_invalid
  (module
    (func $ignore-intermediate-stack-values-after-return
      (local i32)
      (i32.const 10)
      (return)
      (i32.const 20)
      (local.set 0)
    )
  )
  "type mismatch"
)