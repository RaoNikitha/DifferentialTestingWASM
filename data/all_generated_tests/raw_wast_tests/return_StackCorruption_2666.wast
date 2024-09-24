;; 5. Implement a function that uses complex stack operations and have several `return` instructions at different stack heights. Verify that each `return` correctly resets the stack to the appropriate height, preventing any stack underflow or overflow conditions.

(assert_invalid
  (module
    (func $complex-stack-return
      (result i32)
      (i32.const 0)
      (if (then (i32.const 1) (return)))
      (i32.add (i32.const 2) (return))
    )
  )
  "type mismatch"
)