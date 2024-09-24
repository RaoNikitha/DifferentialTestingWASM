;; 6. Test Description: Construct a scenario where a `loop` is nested within another loop, with the inner loop containing a `br` instruction targeting the outermost loop. Verify correct operand stack unwinding and check for loop stack integrity between WebAssembly and `wizard_engine`.

(assert_invalid
  (module
    (func
      (block
        (loop (result i32)
          (loop
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)