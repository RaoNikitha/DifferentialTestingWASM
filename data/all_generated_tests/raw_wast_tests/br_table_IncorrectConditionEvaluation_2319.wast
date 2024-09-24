;; 9. Implement a `br_table` with operands that evaluate zero but require branching to a non-zero index. Verify incorrect default label matching does not interfere with the intended branch label.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (br_table 1 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)