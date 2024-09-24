;; 7. Perform a `call` that returns multiple values and immediately invoke another function, verifying the stack after the function calls to ensure return values are placed correctly.

(assert_invalid
  (module
    (func $returns-multiple-values (result i32 i64)
      (i32.const 1)
      (i64.const 2)
    )
    (func $caller
      (call $returns-multiple-values)
      (call 0)
    )
  )
  "type mismatch"
)