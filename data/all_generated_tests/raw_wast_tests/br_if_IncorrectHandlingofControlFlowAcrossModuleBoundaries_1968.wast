;; 9. **Test Description**:     - **Scenario**: `ModuleA` imports a function from `ModuleB` that contains nested blocks, and within the deepest block, a `br_if` instruction for conditional break is used, returning a value.    - **Constraint Checked**: Ensures that the operand stack is correctly unwound and managed when `br_if` is triggered within deeply nested structures.    - **Relation to Control Flow**: Validates that `br_if` accurately manages deeply nested control structures and returns as expected to the calling module.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_function (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (call $external_function)
            (i32.const 1)
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)