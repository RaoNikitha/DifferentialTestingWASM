;; 2. Test a function with nested `if` conditions, where one condition should trigger `return`. Ensure the stack is correctly managed and the function exits as expected. Mis-evaluated conditions could lead to either missing the return or incorrect stack unwinding.

(assert_invalid
  (module
    (func $nested_return_condition (param i32) (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 2)
        (then
          (if (result i32)
            (local.get 0)
            (then
              (return (i32.const 3))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)