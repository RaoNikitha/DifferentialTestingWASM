;; 3. **Test Description**: Construct a loop with a block inside. The loop includes a `br` instruction targeting the block, and the block contains a `br` terminating the loop. Ensure execution returns correctly to the start of the loop and not beyond.    **Constraint**: Ensures proper execution and unwinding of nested constructs.    **Relation to Infinite Loops**: Mismanaging target label validity and nesting constraints can cause the loop to never terminate.

(assert_invalid
  (module
    (func $test-loop-with-block
      (loop
        (block
          (br 1) ;; branch to the loop
          (br 0) ;; should never be reached
        )
      )
    )
  )
  "invalid label"
)