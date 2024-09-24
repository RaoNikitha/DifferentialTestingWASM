;; 1. Create a `br_table` instruction with an operand that causes an out-of-bounds label index and includes an `unreachable` instruction in the default block. This test checks if the error handling when the operand is out of bounds consistently leads to the `unreachable` instruction being executed, revealing differences in out-of-bounds handling.

(assert_invalid
  (module
    (func
      (block
        (br_table 0 1 2 (i32.const 3))
        (unreachable)
      )
    )
  )
  "unknown label"
)