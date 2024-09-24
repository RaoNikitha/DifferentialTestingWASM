;; 6. **Conditional Import Function Call Wrapping `unreachable`:**    - A module imports a function which executes `unreachable` only within a conditional block. The importing module calls this function conditionally.    - **Constraint:** Ensures that the trap behavior of `unreachable` is correct both when the condition is true and when false.

(assert_invalid
  (module
    (import "env" "unreachable_func" (func $unreachable_func))
    (func
      (if (i32.const 1)
        (then (call $unreachable_func))
      )
    )
  )
  "type mismatch"
)