;; 2. **Test Description**: A nested `block` with internal branching that should not be taken, but if taken, leads to an `unreachable` instruction. This validates the handling of branches within nested blocks and ensures the unreachable isn't executed due to a mismanagement of the nested context.

(assert_invalid
  (module (func $test-block-branching (result i32)
    (block (result i32)
      (i32.const 42)
      (block (br_if 1 (i32.const 0)) (unreachable))
      (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)