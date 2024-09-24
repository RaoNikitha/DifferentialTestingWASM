;; 9. Targeting an undefined label within a complex nested structure:    Set up a complexly nested structure with multiple `block` and `if` constructs, and have the `br` instruction target an undefined label within this hierarchy. This checks the CFG's label definition correctness and comprehensive validation.

(assert_invalid
  (module
    (func $target-undefined-label
      (block
        (block
          (br 2)
        )
      )
    )
  )
  "label index out of range"
)