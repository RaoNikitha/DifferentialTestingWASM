;; 3. **Test Branch to Unreachable in `BLOCK`**: Design a `block` containing `br_if` with a condition that targets an `unreachable` instruction. This ensures the correct label arguments and stack unwinding in non-loop constructs, verifying proper type checks.

(assert_invalid
  (module (func $branch-to-unreachable-in-block
    (block (br_if 0 (i32.const 1)) (unreachable))
  ))
  "branch to unreachable"
)