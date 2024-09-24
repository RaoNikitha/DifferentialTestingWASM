;; - **Test 1**: Create a conditional function call within an `if` block where the `if` condition is true, leading to an internal function call. Test if the function returns expected results or causes incorrect stack manipulation.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (if (param i32) (result i32)
        (i32.const 1)
        (then
          (call $test (i32.const 2))
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)