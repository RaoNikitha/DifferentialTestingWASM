;; 7. **Invalid Branch to Block End:**    - Test Description: Construct a structured block sequence where a `br` instruction incorrectly targets the end of a `block` instead of an intended loop, leading to immediate execution of an `unreachable` instruction.    - Constraint: This ensures forward branches correctly resume execution after the `end` of the block.

(assert_invalid
  (module
    (func $invalid-branch-to-block-end
      (block
        (loop
          (br 1) ;; incorrect target to block end
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)