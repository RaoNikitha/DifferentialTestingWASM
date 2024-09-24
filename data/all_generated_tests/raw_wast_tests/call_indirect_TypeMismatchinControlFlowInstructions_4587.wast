;; 6. **Inconsistent Function Type in Table**:    - Include a function in the table with a different signature than what is expected by `call_indirect` instruction.    - **Constraint**: Required function type at the given table index must match the typeid provided by the `call_indirect`.    - **Relation**: Tests the type conformance enforcement at the function fetching stage in control flow.

(assert_invalid
  (module
    (type $expected (func (param i32) (result i32)))
    (type $unexpected (func (param i64) (result i64)))
    (table funcref (elem $unexpected))
    (func $type-mismatch (call_indirect (type $expected) (i32.const 0) (i32.const 0)))
  )
  "type mismatch"
)