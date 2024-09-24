;; - Test 3: Construct a block where a nested block incorrectly uses a `call` to a function with a return type that doesn't match the outer block's expected return type. This evaluates how the block implementation handles nested calls and propagates type information.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block
          (call $wrong_type_function)
        )
      )
    )
    (func $wrong_type_function (result i64)
      (i64.const 42)
    )
  )
  "type mismatch"
)