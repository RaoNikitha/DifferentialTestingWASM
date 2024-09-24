;; 3. **Test Description:** Create a nested block structure, where the innermost block contains the `unreachable` instruction, and outer blocks contain valid operations.    **Constraint:** Execution should stop immediately upon reaching the `unreachable` in the innermost block and trap.    **Relation to Unreachable Code Execution:** Tests that the `unreachable` instruction properly terminates control flow in nested structures.

(assert_invalid
  (module
    (func $nested-unreachable
      (block
        (block
          (block
            (unreachable)
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)