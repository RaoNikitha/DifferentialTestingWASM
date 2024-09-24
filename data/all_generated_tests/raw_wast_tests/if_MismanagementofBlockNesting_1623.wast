;; Test 4: Formulate an `if` instruction nested within a `block`, containing multiple subsequent `block`s and `if` branches, and within the final `else` block, include a `br_table`. Ensure proper block closures and accurate branching that align with the stack task expectations and contexts.

(assert_invalid
  (module
    (func $nested_if_with_br_table (result i32)
      (i32.const 1) ;; Initial condition.
      (block (result i32)
        (block (result i32)
          (if (result i32)
            (i32.const 1)
            (then (i32.const 10))
            (else 
              (br_table 0 0 (i32.const 20))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)