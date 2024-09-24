;; Test 5: Create a nested block structure with `nop` instructions before a `br_if` instruction that should validate against the outermost block's condition. Verify correct branching.

(assert_invalid
  (module
    (func (block $outer (block $inner (nop) (nop) (nop) (br_if $outer (i32.const 0)))))
  )
  "branch target type mismatch"
)