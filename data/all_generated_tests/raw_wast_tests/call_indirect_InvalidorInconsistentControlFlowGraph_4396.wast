;; Test 5: Calling Non-Funcref Table - **Constraint/Issue**: Verifies the validation of accessing tables of inappropriate types. - **Test Description**: Attempt to call a function residing in a table of a reference type other than `funcref`. The module should trap as only `funcref` types are valid.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 externref)
    (func $non-funcref-table
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "table element type mismatch"
)