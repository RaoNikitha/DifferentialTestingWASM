;; Test 5: Simulate backward branching using `br_table` in a loop structure, with operand types that do not match the loop’s expected input, checking if backward branches have the correct operand type matching. - **Constraint Tested**: Operand type matching and stack handling for backward branches.

(assert_invalid
  (module
    (func (param i32)
      (loop (param i64)
        (block
          (br_table 0 0 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)