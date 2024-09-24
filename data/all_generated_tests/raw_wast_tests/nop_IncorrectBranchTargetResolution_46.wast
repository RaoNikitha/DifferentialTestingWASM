;; 7. **Branching to a Label Block after Nops**: Implement a block where multiple `nops` precede a `br` targeting a label within the same block. Check if the `br` correctly jumps to the label without being misled by the preceding `nop` instructions.

(assert_invalid
  (module
    (func (result i32)
      (block $label (nop) (nop) (br $label) (i32.const 0))
    )
  )
  "type mismatch"
)