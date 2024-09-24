;; 3. **Table Index Out of Bounds**:     Attempt to call a function using `call_indirect` with an index that exceeds the bounds of the table. Ensure both implementations correctly trap and there is no stack underflow or overflow during the error.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func $f (param i32))
    (elem (i32.const 0) $f)
    (func $test
      (i32.const 2) ;; This is out of bounds as the table only has 1 element.
      (call_indirect (type $sig))
    )
  )
  "table index out of bounds"
)