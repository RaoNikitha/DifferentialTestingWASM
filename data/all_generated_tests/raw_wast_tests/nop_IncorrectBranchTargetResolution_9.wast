;; 10. **Test Description: `br` with Multiple Consecutive `nop`**     - **Scenario**: Place multiple consecutive `nop` instructions before a `br` instruction targeting an outer block label.     - **Constraint**: Ensures that even with multiple `nop`, the branch target remains resolved as intended.     - **Context**: Consecutive `nop` placement can test the implementation's handling of non-operational gaps and label integrity.

(assert_invalid
  (module
    (func (block $L1
      nop
      nop
      nop
      br $L1
    ))
  )
  "unknown label"
)