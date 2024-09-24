;; 1. **Test Description**: Create a nested block where the inner block contains a `br` instruction targeting an outer block. This tests correct execution of a forward branch resuming after the appropriate `end` instruction, ensuring proper label indexing and execution flow.    - **Constraint**: Ensure proper label target resolution within nested blocks.    - **Nesting Mismanagement Check**: Verifies if the implementation can correctly manage nested blocks and resolve `br` targets to the correct block label.

(assert_invalid
  (module (func $nested-blocks-br-target (result i32)
    (block $outer (result i32)
      (block $inner
        (br 1)
      )
      (i32.const 42)
      (i32.add)
    )
  ))
  "type mismatch"
)