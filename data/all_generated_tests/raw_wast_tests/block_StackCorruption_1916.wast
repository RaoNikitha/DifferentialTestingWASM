;; 7. **Type Mismatch with Multiple `br_if` Instructions**:    - Construct a block containing multiple `br_if` instructions with operand type mismatches, potentially causing stack corruption on conditional branches.    - Compare how each implementation manages the conditional branching and stack type consistency.

(assert_invalid
  (module (func $type-mismatch-multiple-br_if (result i32)
    (block (result i32)
      (i32.const 1)
      (br_if 0 (f32.const 1.0))
      (br_if 0 (i64.const 1))
    )
  ))
  "type mismatch"
)