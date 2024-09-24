;; 9. **Conditional Blocks with Backward Branch Constraints:**    - Place `br_table` inside conditional blocks with backward branching required to certain labels.    - Verifies if backward branches honor the input constraints of the targeted blocks, properly consuming and pushing stack operands.

(assert_invalid
  (module
    (func $conditional-backward-branch 
      (block 
        (loop $l 
          (i32.const 1) 
          (if (i32.eqz (i32.const 1))
            (then (br_table 0 $l (i32.const 2)))
            (else (br_table 0 $l (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)