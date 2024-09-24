;; 8. Create an `if` block with an indirect function call in the `then` block and a return instruction inside the called function, verifying correct return value and stack behavior.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i32) (return (i32.const 42)))
    (func $type-if-indirect-call
      (if (i32.const 1)
        (then (call_indirect $t (i32.const 0)))
      )
    )
  )
  "type mismatch"
)