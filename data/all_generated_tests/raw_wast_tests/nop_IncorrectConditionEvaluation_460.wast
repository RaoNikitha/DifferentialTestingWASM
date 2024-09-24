;; 1. Define a function with a conditional branch (`br_if`) that follows a `nop` instruction, ensuring that under valid input conditions, the branch should not be taken. Verify if the branch instruction behaves differently in both implementations.

(assert_invalid
  (module
    (func $test
      (block $label
        (nop)
        (br_if $label (i32.const 1))
      )
    )
  )
  "expected stack to be [] or []"
)