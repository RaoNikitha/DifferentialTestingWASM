;; 9. **Test Mismatched Loop Block Results**:    - Design a `loop` where the contained instructions produce results that do not match the declared blocktype output.    - **Constraint**: Ensure instruction results match the blocktype.    - **CFG Impact**: Producing unexpected results can create invalid CFG nodes expecting different operand types.

(assert_invalid
  (module
    (func $mismatched-loop-results
      (loop (result i32)
        (i32.const 1)  ;; mismatched type, block declared to return i32 but contains no return yet
      )
      (drop)
    )
  )
  "type mismatch"
)