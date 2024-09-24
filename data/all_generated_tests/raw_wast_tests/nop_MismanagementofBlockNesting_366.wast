;; 7. **Loop with Multiple Nested Blocks and NOPs**: Implement a loop containing multiple nested blocks, each with a `nop` instruction. Ensure the loop maintains the correct flow and loops the expected number of times.

(assert_invalid
  (module
    (func $loop-test
      (loop $outer
        (block
          nop
          (block
            nop
            (block
              nop
              br $outer
            )
          )
        )
      )
    )
  )
  "type mismatch"
)