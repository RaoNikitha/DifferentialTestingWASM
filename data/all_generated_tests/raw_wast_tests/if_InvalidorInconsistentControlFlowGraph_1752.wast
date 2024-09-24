;; 3. **Test `if` Block with Unreachable Code**:    - Include unreachable instructions inside both `then` and `else` blocks to see if the CFG distinguishes properly between reachable and unreachable code segments.    - **Constraint Checked**: ensures CFG correctly marks and handles unreachable instructions.

(assert_invalid
  (module (func $unreachable-then-else
    (if (i32.const 1)
      (then (unreachable) (i32.const 1))
      (else (unreachable) (i32.const 0))
    )
  ))
  "unreachable code"
)