;; Test 2: Design a `br_table` scenario where the operand from the stack is just outside the boundary of the label vector to verify if the default branch is correctly taken. The test ensures out-of-bounds indexing will consistently branch to the default label.

(assert_invalid
  (module
    (func (block (br_table 0 1 2 (i32.const 3))))
  )
  "unknown label"
)