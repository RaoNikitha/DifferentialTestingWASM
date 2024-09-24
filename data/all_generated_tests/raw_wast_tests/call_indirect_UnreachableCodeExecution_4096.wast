;; 5. **Test: Function Table Overflow Handling**    - Description: Construct a table and frequently insert more functions than the table can hold, then use `call_indirect` with an overflown index to invoke these functions, ensuring it leads to an `unreachable` trap.    - Constraint: Exceeding function table capacity traps.    - Unreachable Execution: Exceeding table bounds should navigate to `unreachable`.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      local.get 0
    )
    (func (call_indirect (type 0) (i32.const 2) (i32.const 1)))
  )
  "out of bounds table access"
)