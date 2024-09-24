;; A test with `if` condition where the `else` branch includes a `call_indirect` to a function index that may not match the expected function type, examining if improper indirect calls lead to incorrect control flow or stack state changes.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func (i32.const 1) 
      (if (result i32) 
        (i32.const 0) 
        (then (i32.const 42)) 
        (else 
          (call_indirect $sig (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)