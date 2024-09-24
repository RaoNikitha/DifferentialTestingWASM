;; 10. Create a WebAssembly module where an innermost `loop` is nested within a `block`, that itself is within another `loop`. Utilize `br` to jump to the outer loop's start from within the innermost loop. Include an `unreachable` instruction right after the branch, testing if the control flow correctly resets to the correct loop without hitting unreachable code.

(assert_invalid
  (module
    (func $test_loop_with_block
      (loop (block (loop (br 2) unreachable)))
    )
  )
  "type mismatch"
)