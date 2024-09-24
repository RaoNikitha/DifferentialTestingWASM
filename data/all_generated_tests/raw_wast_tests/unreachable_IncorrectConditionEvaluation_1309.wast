;; 10. Embed `unreachable` in a functional sequence where a `br_if` is dependent on the sum of multiple condition checks. Verify that `unreachable` traps execution immediately and that `br_if` accurately evaluates the aggregated conditions before the trap.

(assert_invalid
  (module (func $differential-test-unreachable-with-br_if
    (block (br_if 0 (i32.add (i32.const 1) (if (result i32) (unreachable) (i32.const 3)))))
  ))
  "type mismatch"
)