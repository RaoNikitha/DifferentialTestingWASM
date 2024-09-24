;; 3. **Test Name: Excess Operands on Branch**    - Create a block where `br` is used but provide more operands than needed by the target label. This ensures that extra operands are not left on the stack, leading to potential stack corruption.

(assert_invalid
  (module
    (func $excess-operands-on-branch
      (block (result i32)
        (i32.const 1) (i32.const 2)
        (br 0)
      )
    )
  )
  "type mismatch"
)