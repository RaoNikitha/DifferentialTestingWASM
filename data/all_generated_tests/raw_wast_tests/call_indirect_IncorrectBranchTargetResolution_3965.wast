;; 4. **Test Description**: Implement a function that calls `call_indirect` inside a loop. Use an invalid function type index to ensure the trap is correctly handled without infinite looping, ensuring correct branch resolution to the trap handler.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $callee1 (param i32) (result i32) (local.get 0))
    (func $callee2 (param i32) (result i32) (i32.const 42))
    (func $call_indirect_loop
      (param $n i32) (result i32)
      (local $i i32)
      (local.set $i (local.get $n))
      (loop $loop
        (br_if 1 (i32.eqz (local.get $i)))
        (call_indirect (type 0) (local.get $i))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br $loop)
      )
    )
    (start $call_indirect_loop)
  )
  "type mismatch"
)