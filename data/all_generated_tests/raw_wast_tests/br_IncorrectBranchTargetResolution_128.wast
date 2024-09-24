;; Construct a test with nested `if-else` inside `loop` structures. Add a `br` instruction targeting the `if` block (`label 1`) but place it within the `else` block. Ensure this leads to correct label resolution and control flow.

(assert_invalid
  (module
    (func $nested_if_else_loop
      (loop (block (if (i32.const 1) 
        (then (i32.const 1)) 
        (else (br 1) (i32.const 0))))
      ))
    )
  )
  "invalid label"
)