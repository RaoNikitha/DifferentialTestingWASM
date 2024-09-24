;; Test 6: Implement a block that pops `f32` operands but is only followed by control flow instructions (`br`, `br_if`, `br_table`). This will test if the jump operations are type-checked correctly, ensuring the stack unwinds and rewinds required values that match the block's expected types.

(assert_invalid
  (module (func $block-with-control-flow (result f32)
    (block (param f32) (br 0))
  ))
  "type mismatch"
)