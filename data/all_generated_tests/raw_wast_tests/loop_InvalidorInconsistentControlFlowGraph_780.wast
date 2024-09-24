;; 1. **Invalid Nested Loop with Mismatched Block Types**:    - Create a WebAssembly module containing a nested `loop` instruction where the inner loop's `blocktype` does not match the outer loop’s `blocktype`. Verify that the context extension correctly generates and maintains CFG for nested loops in both environments.

(assert_invalid
  (module (func $nested-loop-type-mismatch
    (loop (result i32) 
      (loop (result f64)
        (i32.const 1)
        (br 0)
      )
    )
  ))
  "type mismatch"
)