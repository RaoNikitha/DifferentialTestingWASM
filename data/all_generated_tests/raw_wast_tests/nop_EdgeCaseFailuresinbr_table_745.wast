;; 6. **Test Description**: Embed a `nop` instruction within an `if` branch and follow it with a `br_table` referring to an out-of-bounds index.    - **Constraint**: Ensuring the `nop` does not affect the branching logic based on the condition.    - **Edge Case**: Handling of conditional branching with `br_table` referencing non-existent indices.

(assert_invalid
  (module
    (func $test 
      (if (i32.const 1)
        (then 
          (nop)
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "br_table index out of bounds"
)