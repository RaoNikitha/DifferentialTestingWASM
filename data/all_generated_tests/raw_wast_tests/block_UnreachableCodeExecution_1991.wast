;; 2. Implement a block with a loop construct inside, using `br_if` to choose between continuing the loop and exiting to another block. Place an `unreachable` instruction outside the loop, ensuring the correct branch does not end up executing the `unreachable`.

(assert_invalid
  (module (func $test_loop (result i32)
    (block (result i32)
      (loop (result i32)
        (br_if 1 (i32.const 0))
        (br 0)
      )
      (unreachable)
    )
  ))
  "type mismatch"
)