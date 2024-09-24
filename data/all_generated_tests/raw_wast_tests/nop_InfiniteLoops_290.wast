;; Test 1: Place `nop` inside a loop with an unconditional branch instruction (`br`) that should break the loop immediately. Check if the loop exits as expected.

(assert_invalid
  (module (func $test-loop-nop (loop (nop) (br 0)))
  "type mismatch"
)