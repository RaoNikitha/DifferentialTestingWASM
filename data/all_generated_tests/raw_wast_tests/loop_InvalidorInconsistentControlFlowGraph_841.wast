;; Test a loop that immediately contains a `br` instruction targeting the innermost loop, checking if the CFG handles immediate backward branches appropriately and manages the stack consistency.

(assert_invalid
  (module
    (func $test-loop-br
      (loop (result i32)
        (br 0)
        (i32.const 42)
      )
      (drop)
    )
  )
  "type mismatch"
)