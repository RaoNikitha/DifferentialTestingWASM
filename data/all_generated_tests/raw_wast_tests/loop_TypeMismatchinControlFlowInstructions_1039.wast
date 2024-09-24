;; 10. **Test for Faulty Context Extension in Loops**: Introduce a `loop` with the type `[i32] -> [i64]` and have inside branches or blocks that break this extension, e.g., ending with `[i32] -> [i32]`, ensuring the context extension and label stack manipulation is accurately executed.

(assert_invalid
  (module (func $faulty-context-extension
    (loop (result i64) (i32.const 0) (br 0))
    (i32.const 1)
  ))
  "type mismatch"
)