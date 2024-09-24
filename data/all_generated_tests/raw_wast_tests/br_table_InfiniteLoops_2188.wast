;; 8. **Test 8: Default Label Leading to Inner Loop**    - **Description**: Design a default label in `br_table` that routes to an inner loop, and set looping conditions to validate this branch consistently without exiting.    - **Constraint**: Checks the redirection handling to default labels.    - **Infinite Loop Relation**: Incorrect handling of the default label targeting can erroneously trap the execution within the loops.

(assert_invalid
  (module (func $default-label-inner-loop
    (block (loop (br_table 0 1 (i32.const 2))))
  ))
  "unknown label"
)