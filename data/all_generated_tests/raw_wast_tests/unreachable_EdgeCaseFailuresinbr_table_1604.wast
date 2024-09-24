;; 5. **Test Description:**    - Test a `br_table` with computed indices from expressions, followed by `unreachable`, and verify if the trap from `unreachable` is correctly prioritized over the computation.    - **Constraint:** Checks `unreachable` preempts all index computations and respective `br_table` target executions.    - **Relation to Edge Case:** Distinguishes how index evaluation interacting with `unreachable` is handled.

(assert_invalid
  (module (func $br_table_with_expr_unreachable
    (block
      (br_table 0 0 0 (i32.add (i32.const 0) (i32.const 1)))
      (unreachable)
    )
  ))
  "type mismatch"
)