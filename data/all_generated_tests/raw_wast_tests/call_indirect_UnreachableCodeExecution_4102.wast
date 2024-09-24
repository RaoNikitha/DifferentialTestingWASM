;; 1. **Test Description**:    Define a function `func1` that only contains an `unreachable` instruction. Create a table with `func1` as the first entry. Use `call_indirect` with an index `0` and a type mismatch to trigger the `unreachable`.    - **Constraint Checked**: Type mismatch leading to trap.    - **Relation to Unreachable Code Execution**: The control flow should trap before reaching the `unreachable` instruction.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $func1 (unreachable))
    (elem (i32.const 0) $func1)
    (func (call_indirect (type 0) (i32.const 0) (i64.const 1)))
  )
  "type mismatch"
)