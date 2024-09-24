;; 6. **Test Description**: Create a block ending with a `br_if` that targets an incorrect nested block due to faulty label index calculations in wizard_engine.    - **Constraint**: Check if the branch conditionally jumps to the correct labeled block.    - **Relation**: Tests conditional branching label resolution within nested structures.

(assert_invalid
  (module
    (func $block_conditional_br_invalid
      (block (result i32)
        (block (result f32)
          (br_if 0 (i32.const 1))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)