;; 10. Design a sequence where a function calls another function in a deeply nested manner, with each function in the call chain performing a `return` prematurely. Verify if the nested `return` instructions correctly unwind each frame and return the final value accurately.

(assert_invalid
  (module
    (func $func3 (result i32)
      (return (i32.const 3))
    )
    (func $func2 (result i32)
      (call $func3)
      (return)
    )
    (func $func1 (result i32)
      (call $func2)
      (return)
    )
    (func $func0 (result i32)
      (call $func1)
      (return)
    )
  )
  "type mismatch"
)