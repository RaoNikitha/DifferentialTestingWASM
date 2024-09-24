;; 9. **Test 9: Mixed Branch Types in a Loop**    - Description: Within a loop, combine different types of branch instructions (`br`, `br_if`, `br_table`). Verify consistent and correct branch target resolution for all branch types.    - Constraint: Ensures uniform handling and resolution of mixed branch types targeting loop labels.

(assert_invalid
  (module (func $test_mixed_branch_types
    (block $outer
      (loop $inner
        (br_if $outer (i32.const 1))
        (br_table $inner $outer (i32.const 0))
        (br $inner)
      )
    )
  ))
  "type mismatch"
)