;; Have a nested function call where an inner function returns a type different from its declaration. Ensure the outer function expects the correct return type. Test how both implementations manage this discrepancy in nested calls.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (func $inner (param i32) (result f32) (f32.const 1.0))
    (func $outer (param i32)
      (call 0 (call 1 (i32.const 0)))
    )
  )
  "type mismatch"
)