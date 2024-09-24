;; 5. **Test Description**: Test `call_indirect` inside nested blocks where the inner block contains a valid function call, but the outer block contains an invalid index reference. Validate that the outer block's branch target correctly resolves and traps without affecting the inner block's execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref (elem (ref.func $valid_func)))
    (func $valid_func (param i32) (result i32) (local.get 0))
    (func $outer_block_invalid
      (block
        (block
          (call_indirect (type 0) (i32.const 0) (i32.const 42))
        )
        (call_indirect (type 0) (i32.const 2))
      )
    )
  )
  "index out of bounds"
)