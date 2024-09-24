;; 6. Implement a function that makes an indirect call to a function type incompatible with the signature, followed by an immediate `return`. This tests the type-checking mechanism during function call and return unwinding.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $caller (result i32)
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 1))
      (return)
    )
    (table funcref (elem $caller))
  )
  "type mismatch"
)