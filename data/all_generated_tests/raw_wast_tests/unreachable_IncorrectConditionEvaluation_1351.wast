;; 2. Create a loop with an `i32.const 1` and a `br_if` that should exit the loop when the condition is false. Inside the loop, place an `unreachable` after a condition that should always be false. Test for unintended loop continuation by the presence of the `unreachable` trap.

(assert_invalid
  (module
    (func (loop
      (i32.const 0)
      (br_if 0)
      (unreachable)
    ))
  )
  "type mismatch"
)