;; 7. **Test Name: Loop Branch with Stack Underflow Check**    - Create a loop where a `br` instruction is intended to jump back to the loop's start but the stack is under-populated. This tests for stack underflow on backward branches.

(assert_invalid
  (module
    (func $loop-branch-stack-underflow
      (loop (br 0))
    )
  )
  "type mismatch"
)