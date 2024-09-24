;; 5. Construct a scenario with `block`, `loop`, and `if` constructs where a `br` instruction branches out of all constructs, skipping an intermediate `unreachable` instruction meant to be unreachable if the branch is correct.

(assert_invalid
  (module
    (func $nested_br (result i32)
      (block (result i32) 
        (loop (result i32)
          (block (result i32)
            (if (result i32)
              (then (br 2)) 
              (else (unreachable))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)