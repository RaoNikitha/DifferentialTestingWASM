;; 6. **Test For Loop Initialization**: A loop that contains global and local variable manipulations intended to control loop exits. Tests if the variables are properly initialized and the loop can terminate if conditions met, particularly focusing on improper label or control block initialization.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test (result i32)
      (local $l i32)
      (set_local $l (i32.const 10))
      (loop (result i32)
        (br_if 1 (i32.lt_s (get_local $l) (i32.const 0)))
        (set_global $g (i32.add (get_global $g) (i32.const 1)))
        (set_local $l (i32.sub (get_local $l) (i32.const 1)))
        (br 0)
      )
    )
  )
  "type mismatch"
)