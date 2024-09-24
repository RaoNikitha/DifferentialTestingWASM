;; 5. **Minimal Label Vector with Multiple Defaults**:    Use a `br_table` instruction with a single label vector entry and multiple nested blocks, verifying if the operand handles branches correctly when hitting the default label versus the singular valid label.

(assert_invalid
  (module (func
    (block
      (block
        (br_table 1 0 (i32.const 0))
      )
      (nop)
    )
  ))
  "unknown label"
)