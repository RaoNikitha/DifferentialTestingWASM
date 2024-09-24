;; 7. **Test 7**: Code a nested loop structure with a target `loop` label, then employ a `br` instruction to return to the start of the outer loop. Check if the implementation correctly places the stack values as per the requirements of the targeted loop block.

(assert_invalid
(module
  (func
    (loop $outer (result i32)
      (i32.const 42)
      (block (result i32)
        (br 1) 
      )
    )
  )
)
"type mismatch"
)