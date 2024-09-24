;; 10. **Test Description**: Introduce multiple tables and employ `call_indirect` with cross-table referencing. Invalid cross-references lead to an `unreachable` instruction.    - **Constraint Checked**: Cross-table reference validity.    - **Unreachable Code Execution**: Ensures appropriate traps on invalid cross-references, preventing `unreachable` instructions from being executed.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (table 1 funcref)
    (func (result i32)
      (table.set 1 (i32.const 0) (ref.func 0))
      (call_indirect (type 0) (i32.const 0)))) 
  "type mismatch")