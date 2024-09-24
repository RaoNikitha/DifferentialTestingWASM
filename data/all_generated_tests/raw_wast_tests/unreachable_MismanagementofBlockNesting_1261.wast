;; 2. **Test: Unreachable in Deeply Nested Loops**    - **Description:** Create a function with several nested `loop` structures and an `unreachable` instruction within the innermost loop. Add branch instructions (`br_if`) targeting different loop depths.    - **Constraint Checked:** Checks if the `unreachable` instruction correctly causes traps within deeply nested loops.    - **Relation to Mismanagement of Block Nesting:** Tests correct loop depth handling in the presence of `unreachable`, ensuring proper type matching and control flow interruption.

(assert_invalid
  (module
    (func $nested_loops
      (loop
        (loop
          (loop
            (unreachable)
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)