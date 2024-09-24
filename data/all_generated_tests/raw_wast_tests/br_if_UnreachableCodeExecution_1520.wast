;; 1. **Test Branch to Unreachable in `LOOP`**: Create a `loop` block with a `br_if` conditionally branching to an `unreachable` instruction. The test checks if the correct operand stack handling causes the control flow to reach `unreachable` when the condition is met.

(assert_invalid
  (module (func $loop-branch-to-unreachable
    (loop (br_if 0 (unreachable) (i32.const 1)))
  ))
  "type mismatch"
)