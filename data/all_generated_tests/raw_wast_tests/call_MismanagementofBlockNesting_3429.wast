;; 8. **Invalid Call with Multiple Branches**:    - **Description**: Create a WebAssembly function with multiple branching scenarios where one branch contains an invalid `call` instruction within nested blocks.    - **Constraint**: Include an invalid function index within a branch deep inside nested blocks.    - **Relation to Mismanagement of Block Nesting**: Checks handling of invalid function calls in scenarios with multiple nested branches.

(assert_invalid
  (module
    (func $invalid-call-with-branches
      (block
        (block
          (br_if 0 (i32.const 1))
          (call 999)
        )
      )
    )
    (func (param i32) (result i32) (i32.const 42))
  )
  "unknown function"
)