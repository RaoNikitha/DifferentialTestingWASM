;; 10. **Conditional Loop leading to Unreachable**:    - A loop executed under the `if` construct breaks into an unreachable section upon condition met.    - **Constraint**: Ensures loops within conditional blocks and the resultant path to inactive code are both managed leading to unconditional trap accurately.

(assert_invalid
  (module (func $conditional-loop-unreachable
    (if (result i32)
      (i32.const 1)
      (then
        (loop
          (br_if 0 (i32.eqz (i32.const 0)))
          (unreachable)
        )
      )
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)