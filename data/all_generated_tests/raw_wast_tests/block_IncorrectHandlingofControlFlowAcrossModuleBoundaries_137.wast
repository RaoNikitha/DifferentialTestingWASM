;; Design a module with a `block` that features a `call_indirect` to a function type imported from another module. Validate that the control flow transitions correctly and the stack maintains its state accurately before and after the indirect call.

(assert_invalid
  (module
    (import "mod" "functype" (type $ft (func (param i32) (result i32))))
    (func $indirect-call (result i32)
      (block (result i32)
        (call_indirect (type $ft) (i32.const 10) (i32.const 0))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)