;; Test 2: Place a `nop` at the beginning of a `loop` that expects to produce an `i32` result, followed by stack-producing operations that don't rely on the type expected by the `loop`. Validate if this introduces a type mismatch when exiting the `loop`.

(assert_invalid
  (module 
    (func $loop-test (result i32) 
      (loop (result i32) 
        (nop) 
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)