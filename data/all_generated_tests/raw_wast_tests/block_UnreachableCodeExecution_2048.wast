;; 9. Compose a test with a multiple-case `br_table` that misindexes label references in a nested block setup. Include unreachable at the end to verify if wrong case execution leads to unintended code.

(assert_invalid
  (module (func $br_table-misindexed-label (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 2 1 0 (i32.const 0))
          (unreachable)
        )
      )
    )
  ))
  "type mismatch"
)