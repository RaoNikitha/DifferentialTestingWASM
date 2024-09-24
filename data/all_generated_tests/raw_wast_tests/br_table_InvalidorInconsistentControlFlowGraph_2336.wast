;; 6. Implement a scenario where a `br_table` is used within a conditional block (`if`), with target labels spread across both branches of the conditional. Construct the test so that one of the branches leads to an unreachable code section, revealing potential CFG generation inconsistencies if branches are mismanaged.

(assert_invalid
  (module
    (func (param i32)
      (if (i32.eqz (local.get 0))
        (then 
          (block 
            (br_table 0 (local.get 0))
          )
        )
        (else
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)