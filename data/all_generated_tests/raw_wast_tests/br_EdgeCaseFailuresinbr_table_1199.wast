;; 10. Test a `br_table` instruction where indices reference different type stacks, ensuring correct operand stack management and restoration, especially when indices are out-of-bounds. This evaluates stack consistency across varying index targets.

(assert_invalid
  (module
    (func $br_table_type_mismatch
      (block (result i32)
        (loop (result f32)
          (br_table 0 1 (i32.const 0))
        )
        (i32.const 1)
      )
      (drop)
    )
  )
  "type mismatch"
)