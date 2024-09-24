;; 7. **Test 7**: Create a function that performs early `return` inside a br_table branching construct, making sure that the `return` bypasses the whole br_table mechanism as expected and doesn't fall through incorrectly within the CFG.

(assert_invalid
  (module
    (func $early-return-br_table
      (i32.const 0)
      (br_table 0 (return) (i32.const 1))
    )
  )
  "type mismatch"
)