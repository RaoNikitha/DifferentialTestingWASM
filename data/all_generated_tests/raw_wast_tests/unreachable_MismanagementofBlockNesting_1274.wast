;; 5. **Test Description:**    Construct nested `if` statements with embedded `unreachable` in the `then` branch of the innermost conditional, surrounded by a loop structure, and check if a `br` properly interprets the nesting.    *Constraint Checked:* Consistency of `unreachable` trap within nested structures and accurate branch calculation.    *Mismanagement Focus:* Check handling of `unreachable` in nested conditions within loops to expose failures in control flow interpretation.

(assert_invalid
  (module (func $nested-if-loop-unreachable
    (loop (result i32)
      (if (i32.const 1) (then
        (if (i32.const 1) (then
          (unreachable)
        ))
        (br 1)
      ))
      (i32.const 0)
    )
  ))
  "type mismatch"
)