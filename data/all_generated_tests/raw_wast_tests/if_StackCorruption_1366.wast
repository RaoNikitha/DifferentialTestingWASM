;; 7. **Test 7: Stack Resetting in Deeply Nested `if`**    - **Description**: Implement a deeply nested `if-else` structure where each nested level significantly alters the stack height, testing the ability to correctly reset the stack between nested blocks.    - **Constraint Checked**: Correct stack height management through multiple nested `if-else` statements.    - **Relation to Stack Corruption**: Stacks not correctly managed through deep nesting can become corrupted due to unresolved stack depth changes.

(assert_invalid
  (module
    (func $deeply_nested_if (result i32)
      (local $a i32)
      (local.set $a (i32.const 0))
      (if (result i32) (local.get $a)
        (then
          (if (result i32) (i32.const 1)
            (then
              (local.set $a (i32.const 2))
              (if (result i32) (i32.const 1)
                (then
                  (local.set $a (i32.const 3))
                  (if (i32.const 1)
                    (then
                      (local.set $a (i32.const 4))
                      (br 1)
                    )
                  )
                )
              )
            )
          )
        )
        (else
          (local.get $a)
        )
      )
    )
  )
  "type mismatch"
)