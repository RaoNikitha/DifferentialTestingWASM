;; 5. **Test 5**: Design a block that ends with a `call_indirect`, where the function signature in the indirect table is intentionally inconsistent with the expected resulting type of the block. This aims to reveal potential differences in function signature validation and stack state restoration.

(assert_invalid
  (module
    (table 1 funcref)
    (type $sig (func (result i32)))
    (func $func (result f32)
      (block (result f32)
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)