;; 9. **Test Description**:    Implement a function that calls another function via `call_indirect`, but there is a forking logic that forcibly calls an invalid table index with the caller function ending with `unreachable`.    - **Constraint Checked**: Conditional control flow handling.    - **Relation to Unreachable Code Execution**: The invalid index should lead to a trap, precluding the execution of `unreachable`.

(assert_invalid
  (module
    (type $funcType (func (param i32)))
    (table 1 funcref)
    (func $callee (param i32) (unreachable))
    (elem (i32.const 0) $callee)
    (func $caller (param i32)
      (if (i32.eqz (local.get 0))
        (call_indirect (type $funcType) (i32.const 2) (local.get 0))
        (unreachable)
      )
    )
  )
  "index out of bounds"
)