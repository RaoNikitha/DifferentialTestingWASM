;; Construct a loop where a sequence of instructions includes multiple function calls altering global variable states. The loop should check these global variables to decide on continuation, ensuring both handle global states consistently during function calls inside loops.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $alter-global
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
    )
    (func $test-loop
      (loop (result i32)
        (call $alter-global)
        (if (i32.eq (global.get $g) (i32.const 5)) (then (br 1)))
      )
    )
  )
  "type mismatch"
)