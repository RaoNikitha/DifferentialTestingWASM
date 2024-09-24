;; 7. Add a `nop` within a function that has an early return followed by an `unreachable`. Verify that the function returns correctly and does not erroneously reach the `unreachable`.

(assert_return
  (module
    (func $early_return (result i32)
      i32.const 42
      return
      nop
      unreachable
    )
    (export "early_return" (func $early_return))
  )
  (invoke "early_return")
  (i32.const 42)
)