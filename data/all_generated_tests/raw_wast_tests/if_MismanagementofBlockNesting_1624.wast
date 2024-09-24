;; Test 5: Develop a scenario with an `if` block wrapping multiple nested `block`s and `loop`s. Insert a `br` instruction at various depths to verify the targeted block stack management and validate no exits to wrong depth, especially when false cases jump to `end`.

(assert_invalid
  (module (func $nested-block-branch-mismatch
    (block (i32.const 1)
      (if (result i32)
        (block (loop
          (br 2)   ;; Exiting two nesting levels up
        ))
        (else (i32.const 0))
      )
    )
  ))
  "type mismatch"
)