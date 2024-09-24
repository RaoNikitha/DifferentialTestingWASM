;; 1. Create a `loop` instruction with a block type expecting an `i32` value to be pushed on the stack but branch inside the loop with a `br` instruction that returns an `f32` instead. This tests if the type mismatch for loop inputs is caught by both implementations.

(assert_invalid
  (module
    (func $type-loop-mismatch
      (i32.const 0)
      (loop (result i32)
        (br 0 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)