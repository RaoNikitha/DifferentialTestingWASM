;; 9. **Context Switching with Mismatched Label Types**:    - A loop that contextually reuses a label from an outer block but with type assumptions inconsistency.    - This tests label type-context-switching and ensures correct label reference types in nested loop contexts.    - Specific Constraint: Enforcing label type consistency across different nesting levels in contexts.

(assert_invalid
  (module
    (func $mismatched-label-types
      (block (result i32)
        (loop (result i32)
          (br 0) ;; Branch to the block, not the loop
        )
      )
    )
  )
  "type mismatch"
)