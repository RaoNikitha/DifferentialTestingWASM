;; 4. **Blocks with Branching and `nop`**:    Create blocks with multiple branch instructions (`br` and `br_if`) interspersed with `nop` instructions. Test to ensure that branches correctly target the intended labels, unaffected by the `nop` presence.

(assert_invalid
  (module
    (func
      (block $label (nop) (br $label) (nop))
    )
  )
  "type mismatch"
)