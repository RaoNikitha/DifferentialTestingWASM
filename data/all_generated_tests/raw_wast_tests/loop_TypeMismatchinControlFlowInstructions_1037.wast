;; 8. **Test for Loop with Incorrect Block Result Types**: Construct a `loop` with a block type of `[f32] -> [i64]`, but the instruction sequence within the block ends with `[f32] -> [i64, f32]`. Tests consistency of block result types against defined block type.

(assert_invalid
  (module
    (func $type-mismatching-block-results
      (loop (result f32)
        (f32.const 1.0)
        (i64.const 0)
      )
    )
  )
  "type mismatch"
)