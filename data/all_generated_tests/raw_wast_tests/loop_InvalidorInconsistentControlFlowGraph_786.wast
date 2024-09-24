;; 7. **Mismatched Result Types in Loop**:    - Develop a `loop` instruction where the result types produced by the inner instructions do not match the expected result types specified by the block type. Test if CFG accurately reflects type mismatches.

(assert_invalid
  (module (func $mismatched-result-types
    (i32.const 1) (loop (result i32) (f64.const 42) (br 0))
  ))
  "type mismatch"
)