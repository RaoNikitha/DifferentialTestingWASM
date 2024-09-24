;; 6. **Test Case: Unreachable in Else Block of Conditional**    - Description: Place the `unreachable` instruction inside an `else` block to see if the trap occurs only when the condition is false.    - CFG Constraint: Verifying that the control flow correctly interprets the `else` block's interruption and traps when executed.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (local.get 0)
        (then (i32.const 1))
        (else (unreachable) (i32.const 2))
      )
    )
  )
  "type mismatch"
)