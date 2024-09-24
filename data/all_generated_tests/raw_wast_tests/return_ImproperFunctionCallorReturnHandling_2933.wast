;; 2. **Nested Function Calls with Conditional Returns**:    - Create a function that calls another function which contains conditional `return` statements. This tests if conditional returns within nested calls handle stack unwinding accurately.

(assert_invalid
  (module
    (func $nested-conditional-return (result i32)
      (call $conditional-return-function)
      (i32.const 42)
    )
    (func $conditional-return-function (result i32)
      (if (i32.const 1) (then (return (i32.const 1))))
      (i32.const 2)
    )
  )
  "type mismatch"
)