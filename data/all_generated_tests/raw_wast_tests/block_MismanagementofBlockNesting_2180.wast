;; 1. **Test Nested Blocks with Simple Branching**:    - Construct a test with multiple nested `block` instructions where each block contains a `br` (branch) instruction targeting the outer blocks. Validate that branches correctly exit their intended blocks and resume execution after the `end` instruction. Mismanagement may cause the wrong block to be exited.

(assert_invalid
  (module
    (func $nested-blocks-with-branch (result i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (br 1 (i32.const 42))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)