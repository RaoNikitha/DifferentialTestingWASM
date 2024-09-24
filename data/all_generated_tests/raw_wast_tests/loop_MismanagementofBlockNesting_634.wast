;; 5. **Unwinding Operand Stack in Nested Loops**:    Create a test where nested `loops` require significant stack operations, including unwinding the operand stack at various depths. Ensure that backward branches correctly handle the operand stack unwinding to the appropriate level, verifying the implementation's proper management of operand stack states.

(assert_invalid
  (module
    (func $nested-loop-unwind
      (loop (result i32)
        (i32.const 42)
        (loop (result i32)
          (i32.const 1)
          (br 0)
        )
        (drop)
        (br 0)
      )
    )
  )
  "type mismatch"
)