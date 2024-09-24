;; 8. Implement a function that uses `call_indirect` to invoke another function based on a table index. Ensure correct type checking and proper invocation when table indices are used.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (param i32) (result i32) local.get 0)
    (func $test (param i32) (result i32)
      local.get 0
      call_indirect (type 0) (i32.const 1)
    )
  )
  "type mismatch"
)