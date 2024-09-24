;; 10. **External Label References in Conditional `br_table`**:    - Create a scenario where `br_table` within an `if` block references labels that are only valid if the `else` branch is entered. This captures differences in how context and label state is preserved across both branches in different implementations, specifically under explicit state reset.

(assert_invalid
  (module 
    (func (block
      (if (result i32) (i32.const 1) 
        (then (i32.const 0))
        (else
          (block $l1 (br_table $l1))
        )
      )
    ))
  ) "unknown label"
)