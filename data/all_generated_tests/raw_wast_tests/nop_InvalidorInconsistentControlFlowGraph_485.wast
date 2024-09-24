;; 6. **Test with `nop` in Conditional Branches:**    - Include `nop` within both the true and false branches of an `if` statement to ensure the CFG handles conditional execution paths correctly.    - **Constraint Tested:** Ensures `nop` does not influence the execution or selection of branches in conditional logic.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (local.get 0)
        (then (nop) (i32.const 1))
        (else (nop) (i32.const 0))
      )
    )
  )
  "type mismatch"
)