;; 10. **Test Description:**    Use a `br` to jump out of a `block` and into an outer `block` that has different operand stack requirements.    **Constraint Checked:** Proper unwinding of the inner block's stack and restoration for the outer block.    **Relation to Stack Corruption:** Mismanagement can lead to operands being left behind or improperly restored, resulting in corruption.

(assert_invalid
  (module
    (func
      (block (result i32)
        (i32.const 1)
        (block (result i64)
          (i64.const 2)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)