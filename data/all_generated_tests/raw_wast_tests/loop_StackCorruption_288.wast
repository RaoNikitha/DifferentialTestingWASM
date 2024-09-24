;; 9. Simulate a recursive call within a `loop` that uses `call_indirect`. Ensure that stack frames are properly set up and torn down, thus avoiding stack underflow or overflow across nested loops and calls.

(assert_invalid
  (module
    (type $sig (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
    (func (param i32 i32) (result i32)
      (loop (result i32)
        (call_indirect (type $sig) (i32.const 0) (local.get 0) (local.get 1))
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)