;; 2. **Test for `nop` in between `if` Condition and Else**:    - **Description**: Implement an `if` condition where `nop` is used before the `else` branch and validate the stack state before entering the `else` block.    - **Constraint Checked**: Validates no stack state change across control flow branches.    - **Relation**: If `nop` affects type or stack state due to improper initialization, it will cause type mismatch errors in the `else` branch.

(assert_invalid
  (module 
    (func $test-if-else-nop
      (local i32)
      (if (i32.const 1)
        (then (nop))
        (else (nop) (i32.const 0))
      )
    )
  )
)