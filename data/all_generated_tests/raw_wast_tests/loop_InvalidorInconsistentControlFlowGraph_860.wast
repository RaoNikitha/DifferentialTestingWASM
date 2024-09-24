;; 1. **Invalid Initialization Sequence within Loop Block**:    - Test a loop where the initialization sequence is wrongly placed within nested instructions inside the loop. This should result in an invalid CFG, as the loop starts without proper initialization.

(assert_invalid
  (module (func $invalid-initialization-seq-within-loop
    (loop (result i32)
      i32.const 1
      (block
        nop
      )
    )
  ))
  "invalid initialization sequence within loop"
)