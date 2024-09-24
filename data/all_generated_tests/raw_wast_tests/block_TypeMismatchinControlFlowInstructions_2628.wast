;; - **Test 9 Description**:   Implement a `block` having an expected result type `[]`, but using `br_table` with mismatched type branches (e.g., `i64` values). This ensures that branching constructs respect the type expectations of enclosing blocks.

(assert_invalid
  (module (func $test-block-br_table-type-mismatch
    (block
      (result)
      (br_table 0 0 (i64.const 1))
    )
    (i32.const 0)
  ))
  "type mismatch"
)