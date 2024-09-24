;; Test 3: Construct a scenario where `br_table`'s default label refers to an invalid block type, causing a type mismatch when the branch is taken, checking if the type consistency requirements are enforced. - **Constraint Tested**: Operand type length and type matching between target and default labels.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i64) (br_table 0 1 (i32.const 2)))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)