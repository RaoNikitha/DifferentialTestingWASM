;; 4. **Test Description:**    - Create a `loop` that contains a sequence with an `if` statement, where the false branch leads to `unreachable`. The loop should trap if the condition is not met.    - Constraint: Checks if the `unreachable` instruction within a conditional block inside a loop correctly traps.    - Infinite Loop Relation: Ensures loops don't continue indefinitely when `unreachable` is conditionally executed.

(assert_invalid
  (module (func $loop-with-if-unreachable
    (loop
      (i32.const 0)
      (if (then (unreachable)))
    )
  ))
  "type mismatch"
)