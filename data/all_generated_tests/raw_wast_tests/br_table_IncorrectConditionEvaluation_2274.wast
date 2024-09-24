;; Test 4: Execute a `br_table` with target labels having different but expected operand stack configurations. Ensure mismatched configurations between the operand stack and target block lead to appropriate error handling.

(assert_invalid
  (module
    (func $type-mismatch-between-target-and-stack
      (block
        (block (result i32)
          (i32.const 1)
          (block
            (f32.const 2.0)
            (br_table 0 1 (i32.const 0))
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)