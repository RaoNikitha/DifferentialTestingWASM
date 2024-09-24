;; 4. **Mutual Recursion with Global Variables**:    - **Description**: Create mutually recursive functions that manipulate global variables. Each function sets conditions that call the other function based on global variable values.    - **Reason**: This checks if global variable conditions for breaking out of mutual recursion are met properly, and if not handled correctly, can cause infinite loops.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $mutual1
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (if (i32.lt_s (global.get $g) (i32.const 5))
        (then (call $mutual2))))
    (func $mutual2
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (if (i32.lt_s (global.get $g) (i32.const 10))
        (then (call $mutual1))))
    (start $mutual1)
  )
  "type mismatch"
)