;; Test 9: Test `br_table` with an operand that underflows the expected index range (e.g., negative index value or large positive value beyond unsigned integer range). Verify correct default label branching and appropriate error handling.

(assert_invalid
  (module
    (func (block
      (br_table 0 0 0xFFFFFFFF (i32.const -1))
    ))
  )
  "index out of bounds"
)