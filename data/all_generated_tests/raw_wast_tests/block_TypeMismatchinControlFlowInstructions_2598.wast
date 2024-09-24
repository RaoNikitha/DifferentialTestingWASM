;; 9. **Test 9**: Include control flow instructions within a `block` that leaves the stack with more elements than expected (e.g., a block expecting `[]` but resulting in `[i32, i32]`). This tests whether the block transitions correctly handle excess stack entries.

(assert_invalid
  (module (func $excess-stack-entries
    (block (result i32) (i32.const 1) (i32.const 2) (nop))
  ))
  "type mismatch"
)