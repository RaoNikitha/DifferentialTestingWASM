;; 4. **Miscalculated Operand Stack Operations:**    - Evaluate a scenario where the operand stack does not meet the required input parameters for the `call_indirect` function call. The test should confirm that the incorrect stack operations trigger a trap, verifying error-reporting consistency between the two implementations.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem $f))
    (func $miscalculated-operand-stack
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)