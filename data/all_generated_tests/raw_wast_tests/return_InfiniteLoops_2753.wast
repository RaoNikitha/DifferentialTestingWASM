;; 2. A test including nested `loop` instructions, where the inner loop has a `br` instruction for conditional exit, followed by `return`. Verify if the outer loop impacts the flow control differently in each implementation.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (if (then (br 1 (i32.const 42))))
          (return (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)