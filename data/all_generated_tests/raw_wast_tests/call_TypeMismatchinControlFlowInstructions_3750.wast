;; 9. **Invalid Function Call in Loop with Type Change**:    Insert a loop where an `i32` variable is changed to `f64` within the loop, and then call a function that expects an `i32` parameter. Ensure the parameter type enforcement in such a context.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $change-type-in-loop
      (local $x i32)
      (local.set $x (i32.const 1))
      (loop $loop
        (local.set $x (f64.const 1.0))
        (call $function-that-expects-i32 (local.get $x))
        (br $loop)
      )
    )
    (func $function-that-expects-i32 (param i32))
  )
  "type mismatch"
)