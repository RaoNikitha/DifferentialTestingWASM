;; 2. **Invalid Block Type Assumption**:    - Define a block expecting an integer but insert a `nop` and then attempt to produce a float result within the block.    - The test validates proper type constraints within a block even when `nop` is present.    - **Reasoning**: Confirms `nop` instruction doesn't affect the type enforcement on block results.

(assert_invalid
  (module
    (func $invalid-block
      (block (result f32)
        nop
        f32.const 1.0
      )
    )
  )
  "type mismatch"
)