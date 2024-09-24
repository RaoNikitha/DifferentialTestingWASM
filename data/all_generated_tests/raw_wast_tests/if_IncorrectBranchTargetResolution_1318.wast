;; 9. **Test: Premature `else` Branch Integration**:    - **Description**: Write an `if` block where `else` introduces a `br` to a label allocated for a block further up.    - **Constraint**: Ensures proper blocktype and label validation until `end`.    - **Relation to Branch Target Resolution**: Checks if the implementation correctly places and resolves branch targets within `else`.

(assert_invalid
  (module
    (func $test-premature-else-branch (result i32)
      (block $outer
        (i32.const 1)
        (if (result i32)
          (then
            (i32.const 1)
          )
          (else
            (br $outer)
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)