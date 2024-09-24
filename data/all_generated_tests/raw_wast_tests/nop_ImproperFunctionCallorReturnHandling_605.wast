;; 6. **Test 6**: Place `nop` inside an `if` conditional that causes a `call` to a function followed by an immediate return. Verify that `nop` does not affect the conditional logic nor the execution of the function call and return.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (if (local.get 0)
        (then
          nop
          (call $some_function)
          (return)
        )
      )
    )
    (func $some_function (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)