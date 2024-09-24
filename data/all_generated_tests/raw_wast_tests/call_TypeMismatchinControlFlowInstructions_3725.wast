;; - **Test 4**: Test a `call` instruction within an `if-else` construct, passing a `f64` value instead of the expected `i32`. This test checks type validation between conditional branches and how function calls resolve.

(assert_invalid
  (module
    (func $conditional-call (param i32)
      (if (get_local 0)
        (then (call $call-target (f64.const 42.0)))
        (else (call $call-target (i32.const 42)))
      )
    )
    (func $call-target (param i32))
  )
  "type mismatch"
)