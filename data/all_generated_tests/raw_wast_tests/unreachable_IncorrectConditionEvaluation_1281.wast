;; - **Test 2: Nested Blocks with Multiple Conditional Branches**   ```   Place `unreachable` inside nested blocks with `br_if` instructions evaluating different conditions. Ensure that each branch condition is evaluated properly, and the `unreachable` causes a trap when conditions are false. A difference in implementing condition evaluation could lead to improper control flow and missing traps.   ``` -

(assert_invalid
  (module
    (func $nested-blocks-with-conditional-branches
      (block
        (block
          (br_if 0 (i32.const 0)) 
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)