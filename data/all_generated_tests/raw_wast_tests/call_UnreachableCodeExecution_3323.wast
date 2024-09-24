;; 2. **Test Description**:     - **Setup**: Define a cyclic function where `A` calls `B`, and `B` calls `unreachable`.    - **Constraint**: Ensure `unreachable` in function `B` is correctly trapped.    - **Reasoning**: Tests call stack unwinding and ensures functions leading to unreachable code execute traps consistently.

(assert_invalid
  (module
    (func $A (call $B))
    (func $B (unreachable))
  )
  "unreachable executed"
)