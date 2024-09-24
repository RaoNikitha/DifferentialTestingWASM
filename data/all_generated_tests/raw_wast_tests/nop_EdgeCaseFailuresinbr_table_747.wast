;; 8. **Test Description**: Place a `nop` instruction in different syntactic positions within a module’s function, surrounding a sequence of `br_table` instructions with exceeding indices.    - **Constraint**: Checking cross-functional invariance where `nop` does not impact `br_table`’s control logic.    - **Edge Case**: Ensuring correct boundary checks of `br_table` targets regardless of `nop` placements.

(assert_invalid
  (module 
    (func (result i32)
      (block $target1
        (block $target2
          (block $target3
            (nop)
            (br_table 0 1 2 3 (i32.const 4))
            (nop)
          )
        )
      )
      (i32.const 0)
    )
  )
  "br_table index out of range"
)