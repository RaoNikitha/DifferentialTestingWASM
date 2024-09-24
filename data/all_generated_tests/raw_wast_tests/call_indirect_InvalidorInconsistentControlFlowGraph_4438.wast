;; Test an indirect call sequence where the function indices are dynamically altered through arithmetic operations before being used in `call_indirect`. This ensures that the control flow path accommodates dynamic index calculations.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32))
    (func $g (param i32) (result i32)
      (i32.const 5)
    )
    (elem (i32.const 0) $f)
    (func (param i32)
      (local $index i32)
      (local.set $index (i32.add (local.get 0) (i32.const 1)))
      (call_indirect (type 0) (local.get $index) (i32.const 42))
    )
  )
  "index out of bounds"
)