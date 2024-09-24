;; 10. **Test Description:**    - Use `unreachable` in a function return context where the function signature expects a specific return type (e.g., `i32`). Check if the function signature constraints are upheld.    - **Constraint Checked:** Validates function return type constraints in the presence of `unreachable`.    - **Relation to Type Mismatch:** Ensures there are no type mismatches due to the lack of proper return values when `unreachable` is hit.

(assert_invalid
  (module
    (func $unreachable_with_return_type (result i32)
      (unreachable)
    )
  )
  "type mismatch"
)