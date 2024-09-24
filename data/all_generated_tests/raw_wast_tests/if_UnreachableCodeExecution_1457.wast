;; 8. **Unreachable right after `then` Execution**:    - Place an `unreachable` instruction immediately after several instructions within a `then` block that’s executed conditionally.    - **Constraint**: Directly tests whether the validator follows through proper execution paths ending in an unconditional trap.

(assert_invalid
  (module (func $unreachable-after-then (result i32)
    (if (result i32) (i32.const 1) 
      (then 
        (i32.const 42)
        (drop)
        (unreachable)
      )
      (else
        (i32.const 0)
      )
    )
  ))
  "unreachable code"
)