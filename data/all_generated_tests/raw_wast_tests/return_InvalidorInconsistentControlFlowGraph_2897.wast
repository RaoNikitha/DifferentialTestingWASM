;; 6. **Function with Multiple Returns**:    Create a function with multiple `return` instructions at different points.    - Validates CFG accurately accounting for multiple potential function exit points.

(assert_invalid
  (module
    (func $multiple-returns-invalid (result i32)
      (block (result i32)
        (return (i32.const 42))
        (return (i32.const 1))
      )
    )
  )
  "type mismatch"
)