;; 7. **Test Description**: Provide a scenario where a function includes a block with multiple branches (`br`, `br_if`) targeting the same label, and verify the resolution after a function call in the same block.    - **Constraint**: Ensures nested function calls within blocks correctly resolve multiple branching paths.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $nested-br-call (param i32) (result i32)
      (block $label
        (br_if $label (i32.const 0))
        (call 1 (i32.const 1))
        (br $label)
      )
    )
    (func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)