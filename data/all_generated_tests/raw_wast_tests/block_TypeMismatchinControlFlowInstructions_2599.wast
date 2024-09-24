;; 10. **Test 10**: Set up a `block` that assumes an initial stack height of different types (`i64`, `i32`) but receives mismatching types (`f32`, `f32`). This verifies initial stack assumptions are consistent with the blocktype’s required entry conditions.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32) (f32.const 1.0) (f32.const 2.0))
    )
  )
  "type mismatch"
)