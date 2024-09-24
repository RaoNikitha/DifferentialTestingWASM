;; 1. Test the conditional branch with a valid function index within table bounds, ensuring the operand stack correctly pops and pushes values before and after invoking `call_indirect`.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $type-cond-branch (result i32)
      (i32.const 0)
      (if (result i32)
        (then (call_indirect (type 0) (i32.const 0)))
        (else (i32.const 42))
      )
    )
  )
  "type mismatch"
)