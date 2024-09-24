;; 1. **Test Description**:    Create a `block` instruction with a `br` (branch) that skips over valid code and directly reaches an `unreachable` instruction. The test checks if both implementations trap correctly when branching to an `unreachable` instruction within a `block`.

(assert_invalid
  (module (func $unreachable-block
    (block (result i32)
      (br 0) 
      (unreachable) 
    )
  ))
  "type mismatch"
)