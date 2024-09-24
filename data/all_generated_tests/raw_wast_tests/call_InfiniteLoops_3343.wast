;; 2. **Test Description**:    Create a nested function call scenario where an inner function contains an empty loop with a `br_if` that should exit based on a condition. Ensure differential behavior is detected if the condition check fails, leading to an infinite loop.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      (local $i i32)
      (local.set $i (local.get 0))
      (loop $loop
        (br_if $loop (i32.ne (local.get $i) (i32.const 0)))
      )
      (local.get $i)
    )
    (func $outer (param i32) (result i32)
      (call $inner (local.get 0))
    )
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $inner $outer))
    (func $test
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)