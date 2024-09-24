;; Test 2: Execute a `br_table` instruction with an operand value that is out of bounds for the label vector. Verify that the branch redirects correctly to the default label.

(assert_invalid
  (module
    (func
      (block (i32.const 10) (br_table 1 2 0)) 
    )
  )
  "unknown label"
)