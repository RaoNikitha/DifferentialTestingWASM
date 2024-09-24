;; 8. **Test Description:**    - Use `unreachable` inside a `try` block immediately, followed by instructions that expect values on the stack. Check if the trap interrupts and causes no type inconsistencies.    - **Constraint Checked:** Validates exception handling mechanisms with `unreachable`.    - **Relation to Type Mismatch:** Ensures `try` blocks correctly manage type expectations even when interrupted by `unreachable`.

(assert_invalid
  (module (func $type-try-unreachable-stack-mismatch
    (try (result i32) (unreachable) (i32.const 1)))
  )
  "type mismatch"
)