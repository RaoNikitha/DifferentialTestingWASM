;; 3. **Conditional Branch with Unreachable and Nested Loop:**    - Craft a function with an `if` conditional containing a nested loop. Put the `unreachable` inside the loop body. This checks if both the conditional and the loop correctly cease execution and trap upon hitting `unreachable`.

(assert_invalid
  (module (func $conditional-branch-with-unreachable-and-loop (result i32)
    (if (i32.const 1)
      (then 
        (loop (unreachable) 
          (br 1) 
        )
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)