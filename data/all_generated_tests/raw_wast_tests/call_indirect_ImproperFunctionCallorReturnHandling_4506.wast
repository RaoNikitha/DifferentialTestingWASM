;; 5. **Test Description**: Create nested function calls using `call` and `call_indirect`, where the indirect callee has different parameters and return types.    **Constraint Checked**: Validates proper adherence to function signatures.    **Relation to Improper Handling**: Tests whether indirect calls correctly handle nested function invocation and returns.

(assert_invalid
 (module
  (type (func (param i32) (result i32)))
  (type (func (param i32 i32) (result i32 i32)))
  (table 1 funcref)
  (elem (i32.const 0) 0)
  (func $callee (type 0) (param i32) (result i32) 
        local.get 0)
  (func $caller (type 1) (param i32 i32) (result i32 i32)
        (call_indirect (type 0) (i32.const 0) (local.get 0))
        (local.get 1))
  (export "test" (func $caller))
 )
 "type mismatch"
)