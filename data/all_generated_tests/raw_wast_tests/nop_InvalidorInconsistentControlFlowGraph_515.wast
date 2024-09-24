;; 6. Place `nop` at the end of a `function` and verify there is no impact on the function's return behavior or execution path.    **Constraint:** Confirm `nop` doesn’t interfere with function termination.

(assert_return
  (invoke "test")
  (i32.const 42)
)

(module
  (func $test (result i32)
    (i32.const 42)
    nop
  )
  (export "test" (func $test))
)