;; 4. **`br_if` with Non-zero Condition:**    - A `br_if` using a non-zero integer condition. Check if the branch correctly interprets any non-zero value as true.    - Constraint Checked: Handling of non-zero values in conditional evaluation.    - Relation: Ensures non-zero values are correctly treated as true.

(assert_invalid
  (module
    (func $br_if_non_zero_condition
      (block
        (i32.const 1) (br_if 0 (i32.const 42))
      )
      (nop)
    )
  )
  "unknown label"
)