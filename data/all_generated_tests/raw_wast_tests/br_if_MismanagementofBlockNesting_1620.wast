;; 1. **Test 1**: - **Description**: Nested `block` and `loop` where the `br_if` targets the loop but is nested within a block. - **Constraint Checked**: Verify that `br_if` correctly targets the loop start (backward jump) rather than exiting the block.

(assert_invalid
  (module
    (func $test-1
      (block
        (loop
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)