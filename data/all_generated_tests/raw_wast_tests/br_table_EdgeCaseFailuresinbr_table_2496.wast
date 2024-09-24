;; 6. **Mismatched Operand Types**:    Design a `br_table` where the block types associated with the labels have mismatched operand types compared to what the instruction expects, testing if the implementation catches these type mismatches and generates errors correctly.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result f32)
        (br_table 0 0 (i32.const 1) (local.get 0))
      )
    )
  )
  "type mismatch"
)