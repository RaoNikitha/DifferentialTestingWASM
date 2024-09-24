;; 8. Formulate an `if` statement where the condition is `i32.lt_s`. Follow with an `unreachable` in the true branch and ensure the condition is always false. The presence of a trap would verify incorrect evaluation of the condition.

(assert_invalid
  (module (func $differential_if_unreachable_test
    (if (result i32) (i32.lt_s (i32.const 0) (i32.const 1))
      (then (unreachable))
    )
  ))
  "type mismatch"
)