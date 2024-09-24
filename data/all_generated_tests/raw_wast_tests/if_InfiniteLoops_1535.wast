;; 6. A test where an `if` instruction contains a `br_if` inside its `then` block to break out of a loop, ensuring proper branching out of the `if` block into loop without creating an infinite execution scenario.

(assert_invalid
  (module 
    (func $looping_if_branch (result i32)
      (loop (result i32)
        (i32.const 1)
        (if (result i32) (i32.const 0)
          (then
            (br_if 1 (i32.const 0))
          )
          (else
            (i32.const 2)
          )
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)