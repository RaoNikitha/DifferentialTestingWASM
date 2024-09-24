;; 8. **Test 8: Invalid Type for Loop Break Instruction**    - Description: Use a `br` to break out of a loop, producing a type on the stack that doesn't match the enclosing block's expected result types.    - Reasoning: This checks how type mismatches at control flow boundaries are handled, particularly when breaking out of loops.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32) (i32.const 1) (br 0) (i32.add))
    )
  )
  "type mismatch"
)