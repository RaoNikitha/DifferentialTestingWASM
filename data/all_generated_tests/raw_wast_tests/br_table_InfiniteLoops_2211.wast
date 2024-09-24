;; 1. **Test with Index Out of Range Branching to Default**:     - Provide a `br_table` instruction with an operand index that is out of range, forcing the branch to the default label. This tests how the engine handles out-of-bound indices and if it correctly uses the default target. Improper handling might result in an infinite loop if the default target leads back to the start of the loop.

(assert_invalid
  (module
    (func
      (block (label $default
        (br_table 0 0 0 (i32.const 5)) 
      ))
    )
  )
  "out of range index should branch to default"
)