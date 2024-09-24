;; 1. **Test Description:** Create a nested loop scenario where the inner loop contains a `br` instruction targeting the outer loop based on a specific condition. The test checks if the operand stack unwinds correctly without disrupting the operand types for both loops.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop (result i32)
          (block
            (loop (result i32)
              (block (br 2))
              (i32.const 1) ;; Inner loop body
            )
          )
          (i32.const 2) ;; Outer loop body
        )
      )
    )
  )
  "type mismatch"
)