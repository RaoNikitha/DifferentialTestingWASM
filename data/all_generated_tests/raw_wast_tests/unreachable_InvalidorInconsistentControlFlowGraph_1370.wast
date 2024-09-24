;; 1. **Test Nested Unreachable in Block:**    - Place an `unreachable` instruction inside a deeply nested block where the surrounding code includes loops and conditionals. Ensure the outer block continues execution correctly if the inner block isn't executed. This tests whether the CFG correctly understands nested scoping.    - **Constraint Checked:** Whether `unreachable` within nested `block` statements correctly traps without impacting the outer block's control flow.    - **CFG Relation:** Incorrect CFG interpretation might misattribute the trap to an incorrect level of the nested structure, causing control flow issues.

(assert_invalid
  (module (func $nested-unreachable-in-block
    (block 
      (loop 
        (if (i32.const 1)
          (then 
            (unreachable)
          )
        )
      )
    )
  ))
  "type mismatch"
)