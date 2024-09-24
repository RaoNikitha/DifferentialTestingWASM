;; 4. **Intermediate Operand Type Mismatch with Multiple Labels:**    Create a series of labels with various operand types, then use `br_table` to index into these labels with a value that mismatches stack operand expectation for at least one path. This will test if the implementation correctly validates stack types against all possible branching targets.

(assert_invalid
  (module
    (func (param i32) (param i64) (result i32)
      (block (result i32)
        (block (result i64)
          (block (result f64)
            (block (result i32)
              (br_table 0 1 2 3 4 (local.get 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)