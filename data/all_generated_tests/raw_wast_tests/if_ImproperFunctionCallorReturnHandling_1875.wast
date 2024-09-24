;; 6. Utilize an `if` block with a function call which itself contains an `if` block leading to an indirect function call, enforcing proper execution and stack alignment through nested blocks.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then (i32.const 42))
        (else (call_indirect (type $type-i32-i32) (i32.const 0) (i32.const 0)))
      )
    )
    (func $outer (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then (call $inner (local.get 0)))
        (else (i32.const 99))
      )
    )
    (table funcref (elem $inner))
    (type $type-i32-i32 (func (param i32) (result i32)))
  )
  "type mismatch"
)