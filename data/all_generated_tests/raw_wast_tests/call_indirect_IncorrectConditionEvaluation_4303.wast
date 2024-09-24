;; 2. **Mismatched Function Types**:    Define a function table and attempt a `call_indirect` with a function index whose signature does not match the expected type, resulting in a trap. This ensures that both implementations correctly trap on dynamic type mismatches.      **Constraint**: Validate dynamic type checking conformance for function calls.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table funcref (elem func 0))
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)