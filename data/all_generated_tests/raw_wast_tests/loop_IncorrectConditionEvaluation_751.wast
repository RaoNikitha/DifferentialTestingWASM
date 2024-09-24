;; 2. Design a loop where the `br_if` condition relies on a mutable global variable that changes its value inside the loop. The loop should exit when the global variable reaches a specific value. This tests if the condition evaluation respects changes in global variables.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test
      (loop (result i32)
        (global.set $g (i32.add (global.get $g) (i32.const 1)))
        (br_if 1 (i32.eq (global.get $g) (i32.const 10)))
        (br 0)
      )
    )
  )
  "type mismatch"
)