;; 5. **Br Instruction Within If-Else Chains:**    Implement multiple nested `if-else` chains combined with `br` instructions, specifically aiming to jump to the end of an `if` block. Ensure the control flow does not incorrectly reach `unreachable` instructions within the various branches due to label mismanagement.

(assert_invalid 
  (module 
    (func 
      (block 
        (if (i32.const 1) 
          (then 
            (block 
              (br 1)
            ) 
            (unreachable)
          ) 
          (else 
            (br 1)
          )
        )
      )
    )
  ) 
  "type mismatch"
)