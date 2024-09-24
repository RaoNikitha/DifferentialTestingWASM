;; 4. **Block with conditional calls to imports**:    - Design a block that conditionally calls imported functions based on values on the operand stack.    - Ensure that correct execution paths are followed for `br_if` instructions and that the operand stack maintains correct values upon returning to the calling module.

(assert_invalid
  (module
    (import "env" "foo" (func (result i32)))
    (func $block-with-conditional-calls (result i32)
      (local i32)
      (i32.const 0)
      (block (result i32)
        (block (result i32)
          (call 0) 
          (br_if 1 (local.get 0))
          (call 0)
          (br_if 0 (local.get 0))
        )
        (local.get 0)
      )
    )
  )
  "type mismatch"
)