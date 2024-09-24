;; 3. **Nested Loop with Conditional Branch**    - Create nested loops where an inner loop contains a `br_if` branch based on a complex condition. Ensure the branch only executes correctly when the condition is true within the nested scope.    - **Reason**: Tests the correct handling of nested loops and the correct evaluation of conditions for `br_if` within nested contexts.

(assert_invalid
  (module (func $nested-loop-with-conditional-branch
    (block
      (loop
        (br_if 0 (i32.const 0))
        (block
          (loop
            (br_if 1 (i32.const 1))
          )
        )
      )
    )
  ))
  "invalid branch depth"
)