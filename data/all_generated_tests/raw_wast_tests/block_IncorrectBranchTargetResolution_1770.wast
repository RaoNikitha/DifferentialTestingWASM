;; 1. **Nested Block Targeting**:    Test a nested block structure where a `br` instruction should correctly target an outer block. This checks if both implementations properly resolve the label indexing and unwinding of nested contexts.

(assert_invalid
  (module (func $nested-block-targeting
    (block (block (br 1)))
  ))
  "mismatching label"
)