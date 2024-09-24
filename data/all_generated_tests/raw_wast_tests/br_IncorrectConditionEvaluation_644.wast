;; 5. **`br_if` with Zero Condition:**    - A `br_if` using a zero integer condition. Check if the branch correctly interprets zero as false.    - Constraint Checked: Handling of zero value in conditional evaluation.    - Relation: Ensures zero values are correctly treated as false.

(assert_invalid
  (module
    (func (param i32)
      (block
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)