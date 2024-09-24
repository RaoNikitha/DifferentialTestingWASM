;; 4. Implement a `br_table` in a structure with blocks and conditional `if` instructions at different levels, and provide an operand that targets a label within a deeper nested block, checking if the label index is computed correctly in deeply nested conditions.

(assert_invalid
  (module
    (func $nested-br-table
      (block
        (block
          (i32.const 0)
          (block (br_table 2 (i32.const 1)))  ;; Attempting to branch to a label deeper than current context
        )
        (i32.eqz)
        (drop)
      )
    )
  )
  "unknown label"
)