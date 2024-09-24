;; 8. **Test: Loop with Function Call Modifying Local Variables**     - Description: Use a loop block that makes a function call which modifies local variables within the loop. Return and check the modified values after the function call to ensure the changes persist within the loop context.     - Constraint: Checks for correct local variable management and persistence across function calls within loops.

(assert_invalid
  (module
    (func $update (param $x i32) (result i32)
      local.get $x
      i32.const 1
      i32.add
    )
    (func $test
      (local $i i32)
      (local.set $i (i32.const 0))
      (loop (result i32)
        (local.set $i (call $update (local.get $i)))
        local.get $i
        i32.const 10
        i32.ge_s
        br_if 1
        br 0
      )
      drop
    )
  )
  "type mismatch"
)