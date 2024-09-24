;; 5. **Indirect Branch to Unreachable**:    Design a `br_table` within the loop that contains multiple branch targets, one of which leads to an `unreachable` instruction. Check if selecting the unreachable target correctly triggers a trap.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        block
          (br_table 0 1 (unreachable))
        end
      )
    )
  )
  "type mismatch"
)