;; 7. **Recursive Indirect Call**: Create a recursive function that uses `call_indirect` to call itself via a table. Verify that the implementation handles recursive calls without stack overflow or improper returns.

(assert_invalid
  (module
    (type $sig (func))
    (func $recursive (call_indirect $sig (i32.const 0)))
    (table 1 funcref (elem $recursive))
    (func (call_indirect (type $sig) (i32.const 0)))
  )
  "type mismatch"
)