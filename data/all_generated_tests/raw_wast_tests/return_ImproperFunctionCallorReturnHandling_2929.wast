;; 8. Create a scenario with a function calling itself recursively and performing an early `return` based on a conditional check. The test inspects whether the stack unwinding correctly handles recursive function calls.

(assert_invalid
  (module
    (func $recursive-early-return (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.eqz (local.get 0))
        (return (i32.const 0))
        (call $recursive-early-return (i32.sub (local.get 0) (i32.const 1)))
      )
    )
  )
  "type mismatch"
)