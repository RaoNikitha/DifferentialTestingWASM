;; 9. **Test 9: Loop with Conditional Function Execution and `nop`**:    - **Description**: Loop where a function is conditionally executed, with `nop` instructions between condition checks.    - **Constraint**: Validate that `nop` doesn’t interfere with conditional execution logic.    - **Relation to Infinite Loops**: Ensures conditional execution logic isn’t affected by `nop` causing infinite re-evaluation.    - **Example**: `(loop $L (nop) (if (i32.const 1) (then (call $someFn))) (br_if $L (i32.const 0)))`

(assert_invalid
  (module
    (func $someFn (nop))
    (func (block $B
      (loop $L
        (nop)
        (if (i32.const 1)
          (then (call $someFn))
        )
        (br_if $L (i32.const 0))
      )
    ))
  )
  "invalid function type"
)