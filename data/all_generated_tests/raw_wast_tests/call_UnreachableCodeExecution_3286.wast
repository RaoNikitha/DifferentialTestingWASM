;; 5. **Test 5: Recursive Call Leading to Unreachable**    - Create an infinitely recursive function call leading to an 'unreachable' instruction due to stack overflow or depth constraints.    - **Specific Constraint**: Tests the handling of recursive calls and their impact on the call stack depth and error management.    - **Test Relation**: Detects control flow issues leading to an 'unreachable' state when appropriate checks are not in place.

(assert_invalid
  (module
    (func $infinite-recursive-call
      (call $infinite-recursive-call)
    )
  )
  "unreachable"
)