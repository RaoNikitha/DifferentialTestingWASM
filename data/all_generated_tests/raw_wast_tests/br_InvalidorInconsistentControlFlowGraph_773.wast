;; 4. **Branch to Outermost Control Structure from Deep Nesting:**    - Construct a module with multiple nested `if` and `block` instructions, and attempt a `br` instruction to the outermost control structure.    - Reasoning: Tests if the implementation correctly unwinds the operand stack and resumes execution from the correct point.    - Relation to CFG: Failure to properly manage such branches leads to erroneous paths, disrupting the CFG.

(assert_invalid
  (module
    (func $deep-nesting-branch
      (block $outermost
        (block
          (loop
            (if (i32.const 1)
              (then
                (block
                  (if (i32.const 1)
                    (then
                      (br $outermost)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)