;; 7. Use a loop that incorrectly continues infinitely if the type processing fails properly to handle a polymorphic stack impacted by an `unreachable` leading to mismatched type inference. Evaluate loop behavior in both environments.

(assert_invalid
  (module (func $type-loop-unreachable (result i32)
    (loop (unreachable) (i32.const 1))
  ))
  "type mismatch"
)