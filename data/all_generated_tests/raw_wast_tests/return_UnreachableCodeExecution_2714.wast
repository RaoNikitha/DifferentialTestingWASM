;; 3. **Test Scenario**: Setup a conditional branch that returns a value, followed by an unreachable instruction in the false branch of the condition.    **Constraint**: Check correct value handling and condition evaluation by the `return`.    **Unreachable Code**: Observe if false branch gets executed erroneously.

(assert_invalid
  (module
    (func $conditional-return-unreachable (result i32)
      (i32.const 1)
      (if (result i32)
        (then (return (i32.const 42)))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)