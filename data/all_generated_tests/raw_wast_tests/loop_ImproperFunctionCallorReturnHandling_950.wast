;; 1. **Test Description**: Run a loop with a `call` to a simple function that returns an integer, loop again and call another function that adds a constant value to the result. Check if final result is consistently correct by validating return values after the loop ends.    **Constraint Checked**: Proper function call and return value handling within loop context.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $f1 (type $sig)
      i32.const 10
    )
    (func $f2 (type $sig)
      i32.const 5
    )
    (func $test (result i32)
      (local $i i32)
      (loop $loop
        call $f1
        local.set $i
        br 1
      )
      local.get $i
      call $f2
      i32.add
    )
  )
  "type mismatch"
)