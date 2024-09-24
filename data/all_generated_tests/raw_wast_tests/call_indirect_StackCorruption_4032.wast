;; 1. **Unmatched Function Type Signature**:    - Create a test where the `call_indirect` instruction references a function with a mismatched type signature. This would test if the stack pops the expected argument types and pushes the correct return types, leading to stack underflow if not properly managed.    - Constraint Check: Ensure the dynamically resolved function type does not match the expected type.    - Stack Corruption Relation: Improper type mismatch could lead to incorrect arguments left on the stack or incorrect stack frame setup.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (elem (i32.const 0) $f)
    (func $type-mismatch
      (block
        (call_indirect (type $sig) (i32.const 0) (i32.const 123) (i32.const 456))
      )
    )
  )
  "type mismatch"
)