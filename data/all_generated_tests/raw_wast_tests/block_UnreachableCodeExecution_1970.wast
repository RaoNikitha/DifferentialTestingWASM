;; 1. **Nested Block with Unreachable Reached by Branching**:    - Create a `block` containing nested blocks and have an inner block contain an `unreachable` instruction. Ensure a `br` branch instruction within an outer block incorrectly targets this inner block, possibly due to incorrect context extension, making the `unreachable` instruction reachable.

(assert_invalid
  (module
    (func $nested-unreachable-branch
      (block (result i32)
        (block
          (block (result i32)
            (unreachable)
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)