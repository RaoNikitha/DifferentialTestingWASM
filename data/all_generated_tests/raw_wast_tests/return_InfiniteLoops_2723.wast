;; Write a test where the loop contains a `br_if` instruction that incorrectly evaluates its condition to false, causing the loop to run indefinitely when it should return. Validate if the `return` correctly stops this.

(assert_invalid
  (module
    (func $test (result i32)
      (i32.const 1)
      (loop (result i32)
        (br_if 0 (i32.const 0)) ;; This should evaluate to false and continue the loop indefinitely
        (return (i32.const 2))
      )
    )
  )
  "type mismatch"
)