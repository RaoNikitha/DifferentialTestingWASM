;; 2. **Test: Proper Call with Table Out of Bounds Index**    - Description: Define a function table and use an `call_indirect` instruction with an index that is intentionally out of the table's bounds. The expected outcome is the execution of an `unreachable` instruction due to the invalid index.    - Constraint: Table index out of bounds results in a trap.    - Unreachable Execution: Mis-handling of table index should lead to execution of `unreachable`.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $out_of_bounds_test (result i32)
      (call_indirect (type $sig) (i32.const 2) (i32.const 0))
    )
  )
  "out of bounds table index"
)