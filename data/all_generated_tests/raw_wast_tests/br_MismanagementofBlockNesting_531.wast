;; 2. Construct a `loop` containing nested `block` instructions, followed by a `br` instruction that targets an outer block from inside the loop. This will verify if the implementation properly handles exiting nested structures and jumping out of the loop.

(assert_invalid
  (module
    (func $test-invalid-loop-br-target
      (loop 
        (block 
          (block 
            (br 2) 
          )
        )
      )
    )
  )
  "invalid label"
)