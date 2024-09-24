;; Design an `if` block where the `then` instruction includes calls to functions with mismatched signatures that alter the stack in unexpected ways, checking if control unwinding correctly handles these scenarios.

(assert_invalid
  (module
    (func $alter_stack (result i32)
      (i64.const 42) (i32.wrap_i64)
    )
    (func $test_mismatch (result i32)
      (i32.const 1)
      (if (result i32) 
        (call $alter_stack) 
        (then 
          (i32.add)
        )
      )
    )
  )
  "type mismatch"
)