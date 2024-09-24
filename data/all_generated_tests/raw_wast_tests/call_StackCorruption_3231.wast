;; 10. Test a call to a function that itself calls multiple other functions with varied argument counts and return values. Ensure that intermediate stack states between these nested calls are correctly maintained and not corrupted.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $nested-call-1 (param i32) (result i32)
      (call $nested-call-2 (i32.const 10)) 
    )
    (func $nested-call-2 (param i32) (result i32)
      (call $nested-call-3 (i32.const 20) (i32.const 5))
    )
    (func $nested-call-3 (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
    (func $main (call $nested-call-1 (i32.const 0)))
  )
  "type mismatch"
)