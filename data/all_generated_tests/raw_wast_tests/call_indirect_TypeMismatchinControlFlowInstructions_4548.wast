;; 7. **Test Description**: Design an indirect function call inside nested `block` structures where the outer block expects an `i32` and the inner block performs a `call_indirect` returning `v128`.    - **Constraint**: Ensures nested blocks properly enforce the type constraints on their return values through indirect calls.    - **Relation**: Verifies type conformity in nested control flow with indirect function calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result v128)))
    (func $f (param i32) (result v128) (unreachable))
    (table funcref (elem $f))
    (func $nested-call-indirect
      (result i32)
      (block (result i32)
        (block (result v128)
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)