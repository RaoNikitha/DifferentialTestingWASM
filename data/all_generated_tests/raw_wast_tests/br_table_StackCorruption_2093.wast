;; 3. Design a test where `br_table` uses an out-of-bounds operand, triggering a branch to the default target. Specifically, the stack should have an incorrect type (not i32) before the branch.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 (i64.const 2)))
    )
  )
  "type mismatch"
)