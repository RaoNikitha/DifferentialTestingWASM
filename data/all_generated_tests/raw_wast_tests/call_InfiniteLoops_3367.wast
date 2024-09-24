;; Test 6: Construct a loop that uses a function call to update a counter variable on the stack. Evaluate if the function correctly maintains type consistency and proper manipulation of the counter, ensuring that the loop terminates as expected without running indefinitely.

(assert_invalid
  (module
    (func $increment (param $counter i32) (result i32)
      local.get $counter
      i32.const 1
      i32.add
    )
    (func $loop_function (call $increment (i32.const 0))
      loop $loop_label
        (call $increment (i32.const 1))
        br_if $loop_label
      end
    )
  )
  "type mismatch"
)