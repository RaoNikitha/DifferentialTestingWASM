;; 4. **Test Description**:     - **Setup**: Create nested calls where `A` calls `B`, `B` calls `C`, and `C` has an `unreachable`.    - **Constraint**: Induce unreachable code deep within the call chain.    - **Reasoning**: Ensures both engines manage deep call stacks leading to unreachable code correctly.

(assert_invalid
  (module
    (func $C (unreachable))
    (func $B (call $C))
    (func $A (call $B))
  )
  "unreachable code"
)