;; 3. **Test for `loop` boundary handling via `unreachable`:**    - Place `unreachable` at the start of a `loop` body and ensure the loop's repeated execution never reaches this instruction under normal conditions.    - **Constraint:** Ensures the `loop` control structure respects boundaries and does not inadvertently trap.    - **Related to**: Evaluates if infinite or improper loop handling leads to unexpected traps.

(assert_invalid
  (module (func $test-loop-unreachable-boundary
    (block
      (loop (result i32)
        (unreachable)
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)