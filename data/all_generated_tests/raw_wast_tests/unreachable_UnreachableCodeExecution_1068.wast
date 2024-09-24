;; 9. **Test Description:** Use `unreachable` in a function that is indirectly called via a function table with an invalid type signature mismatch.    **Constraint:** The type signature mismatch should cause an immediate trap before reaching `unreachable`.    **Relation to Unreachable Code Execution:** Tests the interaction of `unreachable` with indirect function calls and type signature validation.

(assert_invalid
  (module
    (table 1 anyfunc)
    (type $sig (func))
    (type $wrong_sig (func (result i32)))
    (func $caller (call_indirect (type $wrong_sig) (i32.const 0)))
    (func $callee (type $sig) (unreachable))
    (elem (i32.const 0) $callee)
  )
  "type mismatch"
)