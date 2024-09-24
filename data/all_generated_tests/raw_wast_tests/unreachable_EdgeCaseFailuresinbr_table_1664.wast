;; 5. **Test Case 5:** Structure conditional statements with an `if-else` block, where the `unreachable` instruction triggers within the true branch, and a `br_table` occurs afterward to check if the unreachable trap prevents the conditional branch from computing. \    _Constraint Checked: Proper handling of control flows within conditional branches._

(assert_invalid
  (module 
    (func (if (i32.const 1) 
      (then 
        (unreachable)
      ) 
      (else 
        (i32.const 0)
      )
    ) 
    (br_table 0 (i32.const 1))
  ))
  "type mismatch"
)