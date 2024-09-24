;; 4. **Test 4**: Test calls a function returning `[i64]` within a block that expects `[i32]` as a return type, to assess how the mismatching return types are handled in the control context.

(assert_invalid
  (module
    (func $type-mismatch-block (result i32)
      (block (result i32) (call 1))
    )
    (func (result i64))
  )
  "type mismatch"
)