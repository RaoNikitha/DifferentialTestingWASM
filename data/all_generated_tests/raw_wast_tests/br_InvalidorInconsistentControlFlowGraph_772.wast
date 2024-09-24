;; 3. **Invalid Backward Branch to Non-loop:**    - Construct a module where a `br` instruction attempts to branch backward to a label within an `if` or `block`, not a `loop`.    - Reasoning: Backward branches should only target loops, so this tests the proper identification of targets.    - Relation to CFG: Incorrect backward targets can confuse loop structures, creating invalid or inconsistent loops in the CFG.

(assert_invalid
  (module
    (func $invalid-backward-branch-to-non-loop
      (block
        (i32.const 0)
        (if (result i32) (then (br 0) (i32.const 1)))
      )
    )
  )
  "invalid backward branch"
)