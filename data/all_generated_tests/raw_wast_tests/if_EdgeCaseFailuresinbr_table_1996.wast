;; 7. **Test Description**: Test nested `if` with alternating true/false `br_table` instructions where inner `br_table` indexes are out-of-range.    - **Constraint**: Validate the control flow across multiple nested `if` instructions and out-of-bound `br_table` targets.    - **Relation to Edge Case**: Confirms the stability and correctness of nested `if` combined with indirect branching.

(assert_invalid
  (module
    (func (result i32) 
      (if (result i32) 
        (i32.const 1) 
        (then 
          (if (result i32) 
            (i32.const 0) 
            (then (br_table 1 0 (i32.const 0))) 
            (else (i32.const 1))
          )
        ) 
        (else 
          (drop (if (result i32) 
            (i32.const 1) 
            (then (br_table 2 1 (i32.const 0))) 
            (else (i32.const 2))
          ))
        )
      )
    )
  )
  "type mismatch"
)