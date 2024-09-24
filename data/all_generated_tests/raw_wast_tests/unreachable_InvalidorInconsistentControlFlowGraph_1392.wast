;; 3. **Unreachable After Nested Blocks:**    - Context: Place an `unreachable` instruction immediately after a sequence of nested blocks.    - Constraint: Ensure that CFG does not attempt to continue control flow past the unreachable, capturing nested context validly.    - Expected Behavior: Trap should occur and no instructions after `unreachable` should execute in either implementation.

(assert_invalid
  (module (func $unreachable_after_nested_blocks
    (block
      (block
        (block
          (unreachable)
          (i32.const 42)
        )
        (i32.add)
      )
      (drop)
    )
  ))
  "type mismatch"
)