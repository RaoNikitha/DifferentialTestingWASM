;; 1. Create a function with a loop that uses a `br_if` instruction. Set the condition for `br_if` to be always true, and include a `return` instruction inside the loop that should be executed when `br_if` fails. Test if the loop exits properly upon `return`.

(assert_invalid
  (module
    (func $br_if-loop-with-return (result i32)
      (loop
        (br_if 1 (i32.const 1))
        (return (i32.const 0))
      )
    )
  )
  "type mismatch"
)