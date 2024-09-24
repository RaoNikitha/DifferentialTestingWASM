;; 3. Design a loop with an `unreachable` instruction that is supposed to be executed only if the loop variable hits a particular value. `br_if` instructions should conditionally branch within the loop. The purpose is to confirm that the loop does not continue beyond the trap condition. If the loop runs indefinitely, trapping hasn't been implemented correctly.

(assert_invalid
(module
  (func $test-loop-unreachable
    (loop $loop
      (i32.const 0)
      (br_if $loop (i32.const 1))
      (i32.const 42)
      unreachable
    )
  )
)
  "type mismatch"
)