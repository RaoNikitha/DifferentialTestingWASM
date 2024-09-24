;; 8. **Test 8: Alternating Forward and Backward Branches**    - Combining forward branches targeting `if` or `block` constructs and backward branches targeting `loops`, testing stack consistency.    - Constraint: Validate consistent stack management when alternating between forward and backward branches.    - Stack Corruption Check: Verify correct operand stack state after mixed direction branches.

(assert_invalid
  (module 
    (func
      (block 
        (br_table 1 0 
          (loop (br 1))
          (if (result i32) (i32.const 1) (then (i32.const 2)) (else (br 0)))
        )
      )
    )
  )
  "type mismatch"
)