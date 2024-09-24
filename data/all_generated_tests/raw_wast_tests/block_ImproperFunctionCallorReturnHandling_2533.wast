;; 4. **Test Unmatched Parameter Types in Nested Function Call:**    - Construct a `block` that contains deeply nested `call` instructions where the parameter types passed do not align with the function signature.    - **Constraint:** Validates parameter type alignment and error detection within nested function calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $type-unmatched-param (result i32)
      (block (result i32)
        (call 0 (f32.const 0.0))
      )
    )
    (func (type $sig) (i32.const 42))
  )
  "type mismatch"
)