;; 10. Perform a test with loop constructs where the `return` instruction is used inside and outside the loop. Confirm that stack management properly differentiates between loop iterations and function returns, preventing stack corruption associated with loop control flow and function return.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-loop (result i32)
      (local i32)
      (loop
        (br_if 1 (return))
      )
      (return (i32.const 1))
    )
  )
  "type mismatch"
)