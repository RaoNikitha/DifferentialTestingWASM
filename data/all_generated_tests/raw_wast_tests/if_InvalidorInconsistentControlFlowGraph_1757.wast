;; 8. **Test `if` with Forward Branches Causing Stack Mismatch**:    - Include forward branches within an `if` block where the resulting stack height mismatches the expected height upon branch execution.    - **Constraint Checked**: tests CFG’s validation of proper stack height consistency.

(assert_invalid
  (module 
    (func $forward-branch-mismatch 
      (result i32)
      (i32.const 0) 
      (if (result i32) 
        (i32.const 1) 
        (then (br 0)) 
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)