;; 1. **Test Description**:    Create a block with a block type specifying a single value return type. Within the block, push a value onto the stack and immediately return with a `br` instruction. Verify that the block type checks ensure the stack has the correct value type at the end. This test monitors how block type is verified in different environments, checking for stack consistency after using branch instructions.

(assert_invalid
  (module (func $incorrect-block-type (result i32)
    (block (result i32)
      (i64.const 1)
      (br 0)
    )
  ))
  "type mismatch"
)