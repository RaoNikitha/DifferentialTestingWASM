;; 9. Set up a structure where an `if` block encloses a `loop`, then incorrectly branch to the `loop` label, which should cause control to mistakenly reach an `unreachable` instruction.

(assert_invalid
  (module
    (func $invalid_branch
      (block
        (if (i32.const 1)
          (loop
            (br 1) 
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)