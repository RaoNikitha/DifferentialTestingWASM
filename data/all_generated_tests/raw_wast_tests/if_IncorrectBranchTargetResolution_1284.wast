;; 5. **Test 5: Mismatched End Instruction Branching**    - Incorrect handling of the `end` instruction within an `if` block causing branches to mistakenly resolve to the end of an outer block.

(assert_invalid
  (module (func $mismatched-end-instruction-branching (result i32)
    (block (result i32)
      (if (result i32)
        (i32.const 1)
        (then (br 1))
        (else (br 1))
      )
    )
  ))
  "type mismatch"
)