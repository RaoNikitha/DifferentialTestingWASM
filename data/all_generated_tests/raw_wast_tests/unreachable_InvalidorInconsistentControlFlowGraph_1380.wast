;; 1. **Test: `unreachable` in Nested Loops and If-Else Blocks**    - **Goal:** Check if the CFG correctly handles nested control structures with `unreachable`.    - **Description:** Create a test where an `unreachable` instruction is placed inside nested loops and if-else blocks. Test whether the execution traps immediately upon reaching `unreachable` inside these nested structures, ensuring subsequent code in loops and conditionals do not execute.    - **Constraint Checked:** CFG handling of nested control structures with `unreachable`.

(assert_invalid
  (module (func $nested-unreachable-test (result i32)
    (block (result i32)
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (if (result i32)
              (i32.const 0)
              (then (unreachable) (i32.const 2))
            )
          )
          (else (i32.const 3))
        )
        (i32.const 4)
      )
    )
  ))
  "type mismatch"
)