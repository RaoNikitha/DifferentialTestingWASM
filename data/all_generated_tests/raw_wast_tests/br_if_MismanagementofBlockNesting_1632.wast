;; 3. **Deeply Nested Loop Break Test**:    - **Description**: Create several nested `loop` structures and use `br_if` in the innermost loop to jump to the outermost loop based on a stack operand. This tests the correct interpretation of label depths in deeply nested loops.    - **Constraint Checked**: Stack Polymorphism, Relative Label Lookup.    - **Expected Failure**: wizard_engine may throw an `OobLabel` error if it incorrectly maps the label-relative indexing.

(assert_invalid
  (module
    (func $deeply_nested_loop_break
      (block
        (loop
          (loop
            (loop
              (br_if 3 (i32.const 1))  ;; Attempt to break to the outermost loop/block
            )
          )
        )
      )
    )
  )
  "unknown label"
)