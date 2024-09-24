;; 3. Implement a `block` containing a branch that conditionally jumps to an `unreachable` instruction if the current stack frame does not match the block's required result type, testing compliance via branching behavior.

(assert_invalid
  (module (func $type-branch-unreachable-block (result i32)
    (block (result i32) (br_if 0 (i64.const 1)) (unreachable))
  ))
  "type mismatch"
)