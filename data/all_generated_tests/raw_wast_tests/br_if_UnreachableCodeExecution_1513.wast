;; 4. **Test 4 - Unreachable with False Condition**:    Create a `br_if` with a false condition that continues execution to an `unreachable` instruction. This tests if the implementations correctly continue to the next instruction post `br_if` rather than branching.

(assert_invalid
  (module (func $unreachable-with-false (block (br_if 0 (i32.const 0)) unreachable))
  )
  "type mismatch"
)