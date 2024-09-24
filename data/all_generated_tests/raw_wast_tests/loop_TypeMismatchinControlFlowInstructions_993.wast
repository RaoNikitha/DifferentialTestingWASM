;; 4. **Loop with Ambiguous Block Type Declaration**:    - A loop is declared with a block type that ambiguously matches multiple potential WASM types due to overlapping valid ranges.    - This tests context-sensitive validation of block types within loops.    - Specific Constraint: Validation of precise block type recognition and enforcement within a loop.

(assert_invalid
  (module (func $ambiguous-block-type
    (loop (param f64) (f32.const 0.0) (br 0))
  ))
  "type mismatch"
)