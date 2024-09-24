;; 6. **Test Description**: A nested function call scenario where `call_indirect` is used inside functions which are themselves called indirectly, creating multiple levels of indirect calls. This aims to verify proper stack management and correct nesting resolution at multiple indirect call levels.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $nested1 (param i32) (result i32)
      (call_indirect (type $sig2) (i32.const 1) (i32.const 0) (i32.const 0))
    )
    (func $nested2 (param i32 i32) (result i32)
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
    )
    (table funcref (elem $nested1 $nested2))
    (func $start
      (call_indirect (type $sig1) (i32.const 0))
    )
    (start $start)
  )
  "type mismatch"
)