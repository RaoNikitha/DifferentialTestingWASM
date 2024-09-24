;; 2. A test with a `loop` that indirectly calls an imported function via `call_indirect`. This function should modify the stack in a specific way to see if stack corruption occurs when control returns to the loop.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (import "env" "external_func" (func $external_func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $external_func)
    (func (result i32)
      (loop (result i32)
        (call_indirect (type $t) (i32.const 0))
      )
    )
  )
  "type mismatch"
)