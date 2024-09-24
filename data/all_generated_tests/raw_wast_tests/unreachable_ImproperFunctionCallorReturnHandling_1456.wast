;; 7. Use an `unreachable` in a conditional block followed by a `return`. Ensure that if the condition is true, the return never executes due to the trap caused by the unreachable.

(assert_invalid
  (module (func $type-unreachable-in-conditional-followed-by-return
    (if (i32.const 1) (then (unreachable)) (return))
  ))
  "type mismatch"
)