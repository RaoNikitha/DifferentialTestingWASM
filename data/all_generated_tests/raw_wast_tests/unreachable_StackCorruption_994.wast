;; 5. Develop a test where `unreachable` is part of an `if` conditional, influenced by an `i32.eqz` comparison. Ensure consistent stack unwinding and trap handling behavior, regardless of conditional outcomes.

(assert_invalid
  (module (func $type-unreachable-if-condition 
    (if (i32.eqz (i32.const 0)) (then (unreachable) (i32.const 1)) (else (i32.const 2))) (drop)
  ))
  "type mismatch"
)