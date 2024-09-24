;; Test 2: Utilize nested blocks where `br_table` targets an inner block. Ensure the operand used for `br_table` refers to an invalid nested block index, causing potential issues in relative index calculation and block unwinding. - **Constraint Tested**: Correct interpretation of relative label indexing within nested blocks.

(assert_invalid
  (module (func $nested-label-invalid-target
    (block
      (block (block (br_table 2 0 1 0 (i32.const 3))))
    )
  ))
  "unknown label"
)