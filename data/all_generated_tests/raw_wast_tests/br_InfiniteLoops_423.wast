;; 4. **Test Description:**    - Incorporate an outer loop with inner loops where the inner loop's `br` instruction should take the control out to resume execution at the outer loop, simulating `continue` behavior. Verify the correct label indexing with `depth` being greater than the top of control stack.    - **Constraint:** The focus is on validating the correct branching to loops with complex control flow and ensuring there’s no infinite loop due to incorrect label validation or depth check.

(assert_invalid
  (module
    (func $nested-loop-branch (param i32) (result i32)
      (block $outer
        (loop $inner-1
          (block
            (loop $inner-2
              (br $outer) 
            )
          )
        )
      )
    )
  )
  "invalid branch target"
)