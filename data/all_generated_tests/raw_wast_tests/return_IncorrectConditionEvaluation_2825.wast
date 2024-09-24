;; 4. **Condition Based on Function Parameters**:    - Use function parameters to set up a condition for `br_if`. Verify if incorrect condition evaluation based on passed parameters causes a return when it shouldn't.

(assert_invalid
  (module
    (func $conditional-return (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.eq)
      (if (then (return (i32.const 0))))
    )
  )
  "type mismatch"
)