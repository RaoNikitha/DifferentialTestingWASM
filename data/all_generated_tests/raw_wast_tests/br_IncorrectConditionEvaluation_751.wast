;; Test 2: Create a nested `loop` structure where the outer loop contains a `br_if` instruction that should branch based on the top stack value being even. Use odd values to test if the branch does not occur, confirming that the condition correctly prevents branching.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (loop (br_if 1 (i32.const 2)))) ;; i32.const 2 is an even number, checking branch based on top stack value
      )
    )
  )
  "type mismatch"
)