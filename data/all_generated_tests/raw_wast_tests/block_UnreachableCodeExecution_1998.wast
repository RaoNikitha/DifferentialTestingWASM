;; 9. Define a block with a loop construct inside, incorrectly using a combination of `br` and `return` in a manner where stack unrolling might erroneously arrive at an `unreachable` instruction, verifying label validity and loop exit more log verification leads to stack unrolling correctness.

(assert_invalid
  (module (func $test-block-loop (result i32)
    (block (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0)) ; Loop will continue indefinitely
        (return (i32.const 2)) ; Return with a value when br_if breaks
      )
      (unreachable) ; Erroneous instruction after loop
    )
  ))
  "unreachable should not be hit"
)