;; 1. **Out-of-Bounds Operand to Invalid Label Type Match:**    Use a `br_table` instruction with an operand that exceeds the highest index in the label vector, ensuring it defaults to a label whose required operand types do not match the stack top. This tests if the implementation correctly handles mismatches in operand type length and type for the default branch.

(assert_invalid
  (module (func $out-of-bounds-operand-type-mismatch (result i32)
    (block (result i32)
      (br_table 0 (i32.const 9999)) (i32.const 1)
    )
  ))
  "type mismatch"
)