;; 6. **Invalid Return Type for Control Flow Join**:    Implement a scenario where multiple branches in a `block` or `if`-`else` structure return different types (`i32` and `f32`). Call functions within these branches and verify how the join type mismatch is managed.

(assert_invalid
  (module
    (func $block-type-mismatch
      (block
        (br_if 0 (i32.const 0))
        (call 1 (i32.const 1))
      )
      (call 2 (f32.const 1.0))
    )
    (func (result i32))
    (func (result f32))
  )
  "type mismatch"
)