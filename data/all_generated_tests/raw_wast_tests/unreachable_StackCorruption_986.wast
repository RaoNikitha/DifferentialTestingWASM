;; 7. Implement a function that pushes several values onto the stack, executes `unreachable`, and then attempts to pop values off the stack. Validate that no values are popped if `unreachable` is executed.

(assert_invalid
  (module (func $unreachable-test
    (i32.const 5) (i32.const 10) (unreachable) (drop) (drop)
  ))
  "type mismatch"
)