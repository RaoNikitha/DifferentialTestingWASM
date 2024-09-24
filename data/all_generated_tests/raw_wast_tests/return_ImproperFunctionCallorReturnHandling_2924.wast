;; 3. Design a function that returns a value after making a call to another function supposed to return multiple values. Verify if intermediate return values from the inner function are managed correctly in the outer function.

(assert_invalid
  (module
    (func $inner (result i32 i32)
      (i32.const 10)
      (i32.const 20)
    )
    (func $outer (result i32)
      (call $inner)
      (return)
    )
  )
  "type mismatch"
)