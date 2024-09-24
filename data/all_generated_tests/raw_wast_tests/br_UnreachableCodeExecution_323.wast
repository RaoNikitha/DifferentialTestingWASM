;; 4. **Conditional Branch in an `if` Block Leading to a Trap:**    - Implement an `if` block with a true condition leading to a `br` instruction targeting an outer block, following which there's an `unreachable` instruction in the false branch.    - Validates if the `br` correctly branches and avoids the unreachable path when the condition is true.

(assert_invalid
  (module
    (func $conditional-branch-trap
      (block $outer
        (if (i32.const 1)
            (then (br $outer))
            (else (unreachable))
        )
      )
    )
  )
  "branching into unreachable path"
)