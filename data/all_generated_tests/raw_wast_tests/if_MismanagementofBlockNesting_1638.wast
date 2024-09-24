;; 9. Create a multi-level nested `if` instruction, each with explicit type differences. Validate that the branches maintain correct type stacks through each level.    - **Constraint**: Ensure correct propagation of type stack changes across nested blocks.    - **Behavior**: Mismanagement could result in type mismatch errors.

(assert_invalid
  (module
    (func $multi-nested-ifs (param i32) (result i32)
      (if (param i32) (result i32)
        (if (param i32) (result i32)
          (if (param i32) (result i32)
            (i32.const 1)
          )
        )
      )
    )
  )
  "type mismatch"
)