;; 2. **Test Description:**    A nested loop structure where the inner loop has a `br` instruction targeting the outer loop. The test ensures the `br` instruction correctly unwinds the operand stack and jumps to the beginning of the outer loop. A wrong implementation leads to infinite loops.

(assert_invalid
  (module
    (func $test
      (loop $outer
        (loop $inner
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)