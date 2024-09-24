;; 1. **Test 1**:    - An `if` block nested inside another `if` block, where the inner block contains an `else` clause.    - This tests whether the context and labeling extend correctly for nested `if-else` structures.

(assert_invalid
  (module (func $nested-if (result i32)
    (if (result i32)
      (i32.const 1)
      (then
        (if (result i32)
          (i32.const 1)
          (then (i32.const 1))
          (else (i64.const 1))
        )
      )
    )
  ))
  "type mismatch"
)