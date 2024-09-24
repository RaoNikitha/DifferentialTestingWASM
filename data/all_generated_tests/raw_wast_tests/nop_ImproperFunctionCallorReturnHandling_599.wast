;; 10. **Test Name: No-Operation with Multiple Conditional Returns**    - **Description**: Include `nop` instructions within conditional return paths in a function.    - **Constraint**: Check that conditional returns execute correctly with `nop` present.    - **Improper Handling Check**: Evaluates if `nop` introduction impacts the conditional return logic.    - **Expected Behavior**: Both implementations should exhibit identical behavior in conditional return handling.

(assert_invalid
  (module
    (func $conditional-nop (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (nop) (return (i32.const 1)))
        (else (nop) (return (i32.const 2)))
      )
    )
  )
  "type mismatch"
)