;; 7. **Conditional Block Inside Loop with Unreachable:**    - Write a function with a loop containing an `if` condition that includes `unreachable`. This test checks if the loop correctly handles the conditional, traps immediately at `unreachable`, and halts subsequent iterations.

(assert_invalid
  (module (func $loop-with-unreachable
    (loop $label (if (i32.const 1) (then (unreachable))) (br $label))
  ))
  "type mismatch"
)