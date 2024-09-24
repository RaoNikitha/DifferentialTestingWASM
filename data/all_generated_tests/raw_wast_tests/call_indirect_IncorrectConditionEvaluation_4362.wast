;; 1. **Test Description**:    - Create a `call_indirect` instruction that selects a function type with mismatched parameter types in a table. Have a `br_if` instruction before the `call_indirect` to conditionally skip the call. This tests if the `br_if` correctly evaluates the condition before dynamically checking function type conformity.

(assert_invalid
  (module
    (type (func (param i64)))
    (table 1 funcref)
    (func $select_func_type
      (br_if 0 (i32.const 1))
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)