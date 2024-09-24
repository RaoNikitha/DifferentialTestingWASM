;; 3. **Test Stack Unwinding with Function Calls in if Else Block**:    Write a function that performs a deep `if-else` nesting, each containing multiple function calls. Verify that unwinding the stack restores state accurately when transitioning through conditionals.

(assert_invalid
  (module
    (func $unwind-test (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then
          (if (result i32) (i32.const 1)
            (then (call $nested-function (i32.const 2))) 
            (else (call $nested-function (i32.const 3)))
          )
        )
        (else
          (call $nested-function (i32.const 4))
        )
      )
    )
    (func $nested-function (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)