;; 7. **Test Description**:    - Have `br_if` determine if `call_indirect` should dynamically resolve a function from a mismatched function signature in the table. Check if `br_if` correctly prevents or allows reaching an invalid function type, trapping accordingly.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func (param i32) (result i32)
      (br_if 0
        (call_indirect (type 0) (local.get 0))
      )
    )
  )
  "type mismatch"
)