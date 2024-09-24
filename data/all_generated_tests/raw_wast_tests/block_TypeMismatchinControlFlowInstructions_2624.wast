;; - **Test 5 Description**:   Validate a `block` that expects no result type (`[]`) but an instruction within the block attempts to push a value on the stack (`i32.const 10`). This should test the implementation's handling of empty result type constraints.

(assert_invalid
  (module (func $type-no-result-expected
    (block
      (i32.const 10)
    )
  ))
  "type mismatch"
)