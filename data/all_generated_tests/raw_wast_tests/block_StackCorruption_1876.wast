;; 7. **Test Description**: Create a nested block scenario where the blocks require different stack heights, causing a potential mismatch in stack height upon entering and leaving block scopes.    - **Constraint**: Verifies handling of stack heights upon entering and leaving nested blocks.    - **Relation to Stack Corruption**: Mismatches in expected stack heights can lead to stack corruption as operations could act on unintended values.

(assert_invalid
  (module (func $nested-block-stack-mismatch
    (block (result i32)
      (block (result i64)
        (i32.const 1)
        (br 1)
      )
      (i64.const 1)
    )
  ))
  "type mismatch"
)