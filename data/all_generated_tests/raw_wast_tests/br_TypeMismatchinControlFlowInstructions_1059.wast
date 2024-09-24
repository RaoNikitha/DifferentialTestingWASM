;; 10. **Test 10: Backward Branch Incorrect Type Matching**    - Design a `loop` where a backward branch `br` incorrectly assumes a `f64` operand stack, while the loop expects `i64`.    - Validates the consistency of operand stack types in backward (loop-targeting) branches.    - Tests proper type matching for backward jump operations as per loop's input types.

(assert_invalid
  (module (func $test10
    (loop $label0 (block (br 0 (f64.const 0))))
  ))
  "type mismatch"
)