;; - **Test 4**: Implement nested `if` instructions that make successive function calls within `then` and `else` branches. Validate if the nesting depth maintains correct context propagation for function returns.

(assert_invalid
  (module (func $nested-if-context (param i32) (result i32)
    (local i32)
    (if (result i32)
      (i32.const 1)
      (then
        (if (result i32)
          (i32.const 1)
          (then (i32.const 0))
          (else (i32.const 2))
        )
      )
      (else
        (call $invalid_func)
      )
    )
  ))
  "unknown function"
)