;; Construct a `br_table` with an index equal to the number of available targets but ensure one target block has a different result type than others. This would assess if WebAssembly’s strict type validation catches type mismatches while `Wizard Engine` should propagate unreachable states.

(assert_invalid
  (module
    (func $br_table-diff-result-type (result i32)
      (block (result i32)
        (block (result i32)
          (block (result f32)
            (i32.const 0)
            (br_table 0 1 2 (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)