;; 6. **Test for Type Mismatch in Loop Restart**: Create a `loop` with the type `[i32] -> [i32]`, but with a branching to restart the `loop` improperly handling stack unwinding and results in an unexpected operand stack type like `[f64]`. This ensures proper implementation of operand stack restoration.

(assert_invalid
  (module
    (func $type-mismatch-loop
      (result i32)
      (i32.const 1)
      (loop (result i32)
        (f64.const 2.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)