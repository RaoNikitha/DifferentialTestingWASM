;; 3. **Test Description**:    Invoke a `call_indirect` with a valid table index but an invalid type index. The function type should not be found, ensuring the engine traps without leaving stack residue.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem))
    (func (result i32)
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type 1 not found"
)