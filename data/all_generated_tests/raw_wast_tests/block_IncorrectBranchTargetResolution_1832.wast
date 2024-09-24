;; 3. **Mismatched Operand Stack Depth on Branching**:    - Construct a `block` with an `i64` block type that contains multiple operations and a `br_if` instruction conditional jump to the outer block on an incorrect stack depth.    - Ensure the implementation properly resolves the label and validates the operand stack height match for the target block.

(assert_invalid
  (module (func 
    (block (result i64)
      (i32.const 10)
      (br_if 0 (i32.const 1))
      (i64.const 20)
    )
    (i64.const 30)
  ))
  "type mismatch"
)