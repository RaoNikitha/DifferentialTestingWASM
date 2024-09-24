;; 10. Design a recursive function call where function index resolution is overridden midway; ascertain that the implementation correctly maintains the call stack and function indices.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $recursive-func (param i32) (result i32)
      (if (i32.const 1)
        (then (call $recursive-func (i32.const 1)))
        (else (i32.const 0))
      )
    )
    (table 0 funcref)
    (func (call $recursive-func (i32.const 1)))
  )
  "type mismatch"
)