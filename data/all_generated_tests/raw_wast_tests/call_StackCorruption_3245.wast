;; 4. **Test Description**: Nested function calls with varying argument counts and types.    - **Constraint**: Validates correct context preservation and stack management for nested calls.    - **Relation to Stack Corruption**: Checks if nested calls improperly alter the stack frame, leading to corruption.

(assert_invalid
  (module
    (func $nested-call (result i32)
      (call $first (call $second (i32.const 10)))
    )
    (func $first (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $second (param i32))
  )
  "type mismatch"
)