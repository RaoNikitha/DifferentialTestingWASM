;; 2. **Nested Unreachable Within Returned Block**:    - Create a function with nested blocks where the inner block has a `return` followed by `unreachable`. The outer block should return normally.    - This tests if the control flow respects stack unwinding and does not trap due to improperly unwound intermediate values.

(assert_invalid
  (module
    (func $nested-unreachable-within-return (result i32)
      (block (result i32)
        (block
          (return (i32.const 42))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)