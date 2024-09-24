;; 9. **Unreachable in Complex Conditional Logic:**    - Context: Integrate `unreachable` within a complex series of conditionals and nested if statements.    - Constraint: Verify CFG correctly identifies `unreachable`, ensuring any control paths traversing it lead to an immediate trap.    - Expected Behavior: A conditional path leading to `unreachable` should always result in a trap during execution in both implementations.

(assert_invalid
  (module (func $complex-conditional-unreachable
    (if (i32.const 1)
      (if (i32.const 1)
        (unreachable)
        (i32.const 1)
      )
      (i32.const 0)
    )
    (i32.add)
  ))
  "type mismatch"
)