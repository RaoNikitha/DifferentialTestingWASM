;; - **Test 4**: Implement a `br_if` with a condition dependent on a stack value that could underflow if not handled correctly. Place an `unreachable` instruction right after the `br_if`. This ensures correct stack handling without allowing control flow to reach the `unreachable` instruction.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0)
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "unknown label"
)