;; 8. Include `unreachable` within a `loop` that contains a `call_indirect` with type mismatching the indirect table entry. Test if the `unreachable` causes a trap first or if the type mismatch is erroneously bypassed.

(assert_invalid
  (module
    (func $type-loop-unreachable-call_indirect (loop (unreachable) (call_indirect (type $invalid_type))))
    (type $invalid_type (func (param f32) (result i32)))
    (table funcref (elem (func $foo)))
    (func $foo (param i32) (result i32))
  )
  "type mismatch"
)