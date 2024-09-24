;; Test 3: A `loop` instruction with an inline block type `[i32] -> [i32]`, but the instructions inside the loop do not produce or consume an `i32` value. This aims to reveal how each implementation enforces type agreement between the loop block type and the contained instructions.

(assert_invalid
  (module
    (func $mismatched-type-loop
      (loop (result i32)
        (nop)
      )
    )
  )
  "type mismatch"
)