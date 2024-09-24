;; 7. **Complex Label Resolution with `nop`**: Implement a function with labeled blocks and several `nop` instructions followed by `br` targeting various labels. Check if all labels are correctly resolved despite the presence of no-operations.

(assert_invalid
  (module
    (func (block $label1 (nop) (br $label1) (nop) (block $label2 (nop) (br $label2) (nop))
    ))
  )
  "label resolution mismatch"
)