;; 3. Develop a function with a nested loop structure, where the inner loop contains a `return` instruction. Trigger the `return` based on a conditional from the outer loop. Ensure the outer loop can correctly handle the `return` and exit gracefully.

(assert_invalid
  (module
    (func $nested-loop-return
      (loop
        (loop
          (br_if 1 (i32.const 0))
          (return)
        )
        nop
      )
    )
  )
  "type mismatch"
)