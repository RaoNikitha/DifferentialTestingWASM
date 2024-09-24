;; 9. Combine nested `block`, `loop`, and `if` instructions, place a `br` instruction in the innermost one targeting the outer `if` block to check if it resumes correctly after the corresponding `end` instruction.

(assert_invalid
  (module
    (func $nested_blocks
      (block
        (block
          (loop
            (block
              (br 2)
            )
          )
          (if (i32.const 0) (then (unreachable)))
        )
      )
    )
  )
  "unknown label"
)