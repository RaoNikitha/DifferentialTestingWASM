;; 7. Construct a test where a function call result is used directly in a `br_if` condition to decide whether another function should be immediately called. Incorrect condition evaluation would lead to an unexpected call order.

(assert_invalid
  (module
    (func $f1 (result i32) (i32.const 1))
    (func $f2)
    (func (param i32)
      (br_if 0 (call $f1))
      (call $f2)
    )
    (type (func (result i32)))
    (type (func))
  )
  "type mismatch"
)