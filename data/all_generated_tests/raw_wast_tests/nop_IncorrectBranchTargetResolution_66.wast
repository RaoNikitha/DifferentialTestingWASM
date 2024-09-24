;; Create test cases involving `block` structures with boundary checks and `nop` instructions to assess whether the `br` instructions correctly resolve branch targets, ensuring the boundary conditions around `nop` do not affect control flow.

(assert_invalid
  (module
    (func (block $label (nop) (br $label)))
  )
  "unknown label"
)