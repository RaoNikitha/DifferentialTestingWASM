;; 6. **Complex Block Structure Test:**    - Design a block with multiple nested levels, each containing control instructions and finally an `unreachable`. Include `br_table` instructions intended to jump to specific nested levels based on stack values. Ensure the `unreachable` breaks resolution consistency.

(assert_invalid
  (module (func $complex-block-structure-test 
    (block 
      (block 
        (block 
          (block 
            (i32.const 0) 
            (br_table 0 1 2 3)
            (unreachable)
          )
        )
      ) 
    )
  ))
  "type mismatch"
)