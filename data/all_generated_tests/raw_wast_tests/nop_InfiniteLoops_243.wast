;; 4. **Test 4: Loop with Immediate Break and `nop`**:    - **Description**: A `loop` that includes `nop` instructions followed by a `br` instruction that immediately exits the loop.    - **Constraint**: Ensures `nop` doesn’t prevent the loop from breaking immediately.    - **Relation to Infinite Loops**: Detects if `nop` incorrectly causes continuance of the loop rather than breaking it.    - **Example**: `(loop $L (nop) (br $L) (nop))`

(assert_invalid
  (module
    (func $test
      (loop $L
        (nop)
        (br $L)
        (nop)
      )
    )
  )
  "unreachable code"
)