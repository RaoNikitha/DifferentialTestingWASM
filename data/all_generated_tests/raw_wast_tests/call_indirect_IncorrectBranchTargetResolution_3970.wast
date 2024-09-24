;; 9. **Test Description**: Create a table with partially initialized entries. Use `call_indirect` to target an uninitialized entry and validate the trap branching target. The irrelevant function calls should not influence the correctness of the trap handling.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 2 funcref)
    (func $call-uninitialized-entry
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "uninitialized table entry"
)