;; 2. **Test Description**: Use nested blocks with different blocktypes where the inner block consumes and produces values that do not match the outer block's expectations, leading to a stack that is either under or over-filled.    - **Constraint**: Checks whether the context and stack are managed correctly across nested blocks.    - **Relation to Stack Corruption**: Mismanagement in switching between contexts could leave the stack in an unpredictable state.

(assert_invalid
  (module (func $nested-block-type-mismatch (result i32)
    (block (result i32)
      (block (result f32) (i32.const 42) (br 0) (i32.const 1))
    )
  ))
  "type mismatch"
)