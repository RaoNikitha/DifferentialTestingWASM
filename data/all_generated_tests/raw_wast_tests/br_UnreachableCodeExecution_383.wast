;; 4. **Test 4: Unreachable Due to Overascendant Block Branch**    - Design a `block` with an enclosed `if` and another `br` instruction targeting a label incorrectly referring to an outer block, followed by an `unreachable` statement.    - Tests the handling of invalid label targets and whether execution can reach the unreachable instruction.

(assert_invalid
  (module
    (func $unreachable-due-to-outer-block-branch
      (block $outer
        (if (i32.const 1)
          (then
            (br 1)  ;; incorrectly targets the outer block
          )
        )
        unreachable
      )
    )
  )
  "unknown label"
)