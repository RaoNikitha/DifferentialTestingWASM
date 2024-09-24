;; - **Test 9**:   Include a `loop` followed by a `br_if` that incorrectly pops values of type `i32` when the loop expects those of type `i64`.   - **Reason**: Loop instructions require consistent type management across iterations.   - **Constraint**: Loop branches must align with the loop’s structured type expectations.

(assert_invalid
  (module
    (func (loop (result i64) (br_if 0 (i32.const 1))))
  )
  "type mismatch"
)