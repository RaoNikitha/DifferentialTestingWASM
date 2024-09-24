;; 5. Set up a nested `if` construct where both branches contain `unreachable`. The outer `if` should have a false condition, and the inner `if` a true condition. The test will check if either `unreachable` instruction traps, suggesting incorrect condition handling.

(assert_invalid
  (module (func $nested_conditional_unreachable
    (if (i32.const 0) 
      (then (if (i32.const 1) (then (unreachable)))))
  ))
  "type mismatch"
)