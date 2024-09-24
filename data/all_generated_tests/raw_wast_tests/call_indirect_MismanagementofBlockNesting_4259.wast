;; 8. **Test Description**: Use `call_indirect` within a block nested inside another block that has already performed several operand manipulations. This tests whether the final operand stack state before the indirect call is consistent with the expectations, respecting all previous nested operations.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $func1))
    (func $func1 (param i32) (result i32)
      local.get 0
    )
    (func $nested-blocks
      (block
        (block
          (i32.const 0)
          (i32.mul)
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
  )
  "operand stack underflow"
)