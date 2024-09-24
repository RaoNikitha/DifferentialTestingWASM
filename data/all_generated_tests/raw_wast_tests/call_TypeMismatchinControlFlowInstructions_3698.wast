;; 7. **Test 7**: Test involves a call to a function expecting `[f32]` arguments within a block but is supplied `[i32]` arguments. This tests the mismatch handling of argument types in control flow instructions.

(assert_invalid
  (module
    (func $type-mismatch-in-block
      (block (call 1 (i32.const 42)))
    )
    (func (param f32))
  )
  "type mismatch"
)