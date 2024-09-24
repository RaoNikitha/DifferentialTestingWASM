;; 6. **Test Description:** Design a `br_table` where the default label itself is nested within another block, ensuring proper control flow unwinding when the default label is ultimately branched to.    - **Constraint Checked:** Checks correct control flow when default label is deeply nested.    - **Relation to Incorrect Branch Target Resolution:** Misresolvering could result in incorrect control flow.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 (i32.const 3) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)