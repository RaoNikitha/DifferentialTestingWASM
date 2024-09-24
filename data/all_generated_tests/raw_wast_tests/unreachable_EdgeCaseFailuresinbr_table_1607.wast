;; 8. **Test Description:**    - Test `br_table` with non-integer indices (e.g., floating-point values) and include `unreachable` in scenarios enforcing traps before index checks.    - **Constraint:** Ensures that `unreachable` dominates over non-integer index validation.    - **Relation to Edge Case:** Probes for consistent error handling in index type mismatches influenced by `unreachable`.

(assert_invalid
  (module (func $type-br_table-unreachable
    (unreachable) (br_table 0 0 (f32.const 2.0))
  ))
  "type mismatch"
)