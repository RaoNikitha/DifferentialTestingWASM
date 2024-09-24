;; 7. **Inconsistent Branch Parameter Matching:**    - Use a `br` instruction to branch to a `block` or `if` with mismatched forward parameter types.    - **Constraint Checked:** Transformations on stack operands matching the output type.    - **CFG Impact:** If operand stack management fails, it might invalidate correctly defined CFG branches.

(assert_invalid
  (module (func $type-mismatch-br
    (block (result i32)
      (i32.const 42)  ;; Push an int to the stack
      (br 0)          ;; Unconditional branch to the block with mismatched result type
    )
  ))
  "type mismatch"
)