;; Implement a loop with multiple `return` statements placed at different points. Validate if a `return` executed deep within the stack unwinds the stack correctly and prevents the loop from running infinitely.

(assert_invalid
  (module
    (func $type-loop-with-returns (result i32)
      (i32.const 0)
      (loop 
        (br_if 0 (i32.const 1))
        (i32.const 2)
        (return (i32.const 3))
      )
    )
  )
  "type mismatch"
)