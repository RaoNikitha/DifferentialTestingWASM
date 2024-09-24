;; 8. **Test Description**: A loop that repeatedly toggles a boolean variable and uses `br_if` to exit if the variable is true. The loop should correctly exit on toggling to true.    - **Constraint**: Verifies `br_if` correctly evaluates a toggling boolean condition.    - **Differential Behavior**: Loop continues despite the boolean variable being true or exits when false, showing incorrect condition handling.

(assert_invalid
  (module
    (func $loop-br_if-toggle
      (local $flag i32)
      (i32.const 1)
      (set_local $flag)
      (loop (result i32)
        (get_local $flag)
        (i32.const 1)
        (i32.xor)
        (tee_local $flag)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)