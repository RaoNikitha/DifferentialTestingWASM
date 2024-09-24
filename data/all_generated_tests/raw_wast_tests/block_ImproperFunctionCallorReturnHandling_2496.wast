;; A `block` instruction includes a `call_indirect` inside a nested block that itself contains further nested function calls to test recursive and nested function call validity. This examines if the engines properly manage stack unwinding and return values through layers of nested function calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $recursive (type $sig) (param $p i32) (result i32)
      (if (result i32) (i32.eqz (local.get $p))
        (then (i32.const 1))
        (else
          (i32.mul (local.get $p) (call_indirect (type $sig) (i32.sub (local.get $p) (i32.const 1)) (i32.const 0)))
      ))
    )
    (func (result i32)
      (block (result i32)
        (i32.const 5)
        (call_indirect (type $sig) (i32.const 5) (i32.const 0))
      )
    )
  )
  "type mismatch"
)