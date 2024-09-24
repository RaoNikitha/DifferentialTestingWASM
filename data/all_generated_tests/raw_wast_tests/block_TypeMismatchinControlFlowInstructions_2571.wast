;; 2. **Test Description**:    Construct a `block` that is supposed to produce no result (`blocktype` of `void`), but include instructions that push an `i32` onto the stack before the `end`. Verify if implementations handle excess stack items.    **Constraint**: Stack must match the block result type.    **Relation**: Checks enforcement of void result type in a block's control flow.

(assert_invalid
  (module (func $block-void-type-mismatch
    (block (result) (i32.const 42) end)
  ))
  "type mismatch"
)