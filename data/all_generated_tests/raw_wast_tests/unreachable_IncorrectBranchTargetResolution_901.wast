;; 2. Embed an `unreachable` instruction within a conditional block that also includes a `br_if` instruction targeting an outer block. Verify that the `unreachable` triggers a trap immediately, and ensure the branch does not incorrectly resolve to an unintended block.

(assert_invalid
  (module (func $type-br_if-unreachable-in-cond
    (block $outer 
      (block 
        (if (i32.const 1)
          (then 
            (unreachable)
            (br_if $outer (i32.const 0))
          )
        )
      )
    )
  ))
  "type mismatch"
)