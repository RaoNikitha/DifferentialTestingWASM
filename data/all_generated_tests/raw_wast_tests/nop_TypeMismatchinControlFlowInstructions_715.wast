;; 6. **Test 6: `nop` in an invalid `br_if` Type Usage**    - Include a `nop` before a `br_if` instruction where the branch's target type contradicts the expected type.    - **Constraint**: `nop` should not interfere with branch target type checking.    - **Type Mismatch Check**: Confirms that the branch instruction correctly validates target types.

(assert_invalid
  (module (func $invalid-br_if
    (block $label
      (nop)
      (i32.const 0)
      (br_if $label (result i32))
    )
  ))
  "type mismatch"
)