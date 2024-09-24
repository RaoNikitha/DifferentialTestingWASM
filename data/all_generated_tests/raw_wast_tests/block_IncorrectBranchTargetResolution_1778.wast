;; 9. **Dynamic Branch Target Testing**:    Use dynamic stack values affecting `br_table` targets within a block to test if the implementations correctly manage dynamic branch target resolutions without miscounting nesting levels.

(assert_invalid
  (module
    (func (result i32)
      (block
        (br_table 0 0 (i32.const 1))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)