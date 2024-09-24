;; 3. Insert an `unreachable` inside a nested loop structure where the outer loop breaks based on a condition evaluated in the inner loop. Verify that upon hitting `unreachable`, the execution traps as expected without continuing the loop evaluation.

(assert_invalid
  (module (func $nested-loop-unreachable
    (loop (loop
      (unreachable)
      (br_if 1 (i32.const 0))
    ))
  ))
  "type mismatch"
)