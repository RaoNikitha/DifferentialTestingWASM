;; 2. **Test 2**:    - An `if` block nested within a `block` instruction with multiple `br_if` instructions targeting various depths.    - Ensures nested blocks are correctly identified and `br_if` instructions are accurately evaluated by both engines.

(assert_invalid
  (module (func $nested-br_if
    (block
      (if (i32.const 1)
        (then (br_if 1 (i32.const 0)))
        (else (br_if 0 (i32.const 1)))
      )
    )
  ))
  "invalid branch depth"
)