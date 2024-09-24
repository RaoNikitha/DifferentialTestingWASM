;; 4. **Test Description**: Use `call_indirect` to jump to a function with a mismatched signature in terms of argument types and verify if the type check is appropriately enforced.

(assert_invalid
  (module
    (type (func (param i64)))
    (table 1 funcref)
    (func $sig-mismatch (call_indirect (type 0) (i32.const 0) (i32.const 42)))
  )
  "type mismatch"
)