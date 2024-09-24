;; 7. **Recursive Function Call in Nested If-Else Blocks**:    - Test Description: Create a nested `if-else` structure with recursive function calls, ensuring the recursion manages stack depth correctly.    - Relevant Constraint: Ensures recursive function stack states are maintained and not disrupting control flow.    - Improper Handling Scenario: Detect if `wizard_engine` fails at maintaining the correct stack state during recursive calls within nested blocks.

(assert_invalid
  (module
    (func $recursive_if_else (param i32) (result i32)
      (if
        (result i32)
        (i32.eqz (local.get 0))
        (then (i32.const 42))
        (else
          (i32.add
            (local.get 0)
            (call $recursive_if_else (i32.sub (local.get 0) (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)