;; 7. Create a structure with nested functions where `call_indirect` inside different scopes of functions references the function type defined outside. This test ensures the correct handling of context propagation and scope management.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $func1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $func2 (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0))
    )
    (elem (i32.const 0) $func1)
    (func $nested_func (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0))
    )
  )
  "type mismatch"
)