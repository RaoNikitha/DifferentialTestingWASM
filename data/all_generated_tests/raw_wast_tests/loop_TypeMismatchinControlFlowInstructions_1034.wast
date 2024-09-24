;; 5. **Test with Mismatched Branch Table Types**: Implement a `br_table` inside a `loop`, where the indirect branch table has mismatched result types compared to the declared loop type. This will check if `br_table` handles type mismatches gracefully.

(assert_invalid
  (module
    (func $test-type-mismatch-br_table
      (loop (result i32)
        (block (result i32)
          (br_table 0 0 (i32.const 0)) ; indirect branch with mismatched result type
        )
      )
    )
  )
  "type mismatch"
)