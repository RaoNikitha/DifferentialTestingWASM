;; 7. **`nop` instruction in an invalid block label target type**:    Place a `nop` inside a labeled block with an invalid type associated with that label target to check if type mismatching occurs when jumping to this label.    This ensures `nop` does not affect the labeled type-checking mechanism.

(assert_invalid
  (module
    (func (block $label i32 (nop))))
  "type mismatch"
)