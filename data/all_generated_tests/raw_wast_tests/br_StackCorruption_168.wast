;; 9. **Test Description:**    Use a `br` within nested `if` and `loop` structures with multiple branches targeting various labels.    **Constraint Checked:** Correct label interpretation and relative indexing through nested structures.    **Relation to Stack Corruption:** Misinterpreting targeted labels can corrupt stack by improper operand operations.

(assert_invalid
  (module
    (func
      (block (if 
        (i32.const 1) 
        (then (br 1)) 
        (else 
          (loop 
            (br 2) 
          )
        )
      ))
    )
  )
  "unknown label"
)