;; 8. **Test Description**: A `loop` containing function calls (`call`) that modify global variables, which are further used in subsequent iterations of the loop.    - **Constraint**: Tests if globals modified within a loop via function calls correctly influence loop iterations.    - **Improper Handling**: Incorrect synchronization between global variable state and loop control leading to erroneous behavior. -

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global
      global.get $g
      i32.const 1
      i32.add
      global.set $g
    )
    (func $test_loop
      (loop $L
        (call $modify_global)
        global.get $g
        i32.const 10
        i32.lt_s
        (br_if $L)
      )
    )
  )
  "global variable synchronization failure"
)