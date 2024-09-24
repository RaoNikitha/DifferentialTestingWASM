;; 6. **Out-of-Bounds Operand in BrTable:**    - Use a `br_table` instruction where the operand is out of bounds, forcing it to always use the default label. Verify if the stack remains consistent and correctly managed after the branch.

(assert_invalid
  (module (func $out-of-bounds-operand
    (block (br_table 0 1 (i32.const 2)))
  ))
  "unknown label"
)