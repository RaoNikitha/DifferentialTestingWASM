;; 2. **Test for Branching on True Condition with Global Variable within Loop**    - **Description**: Develop a loop containing a `br_if` instruction that checks a global variable initialized to 1, ensuring the branch occurs only when the condition is true.    - **Constraint Checked**: Validates proper evaluation of the true condition using global variables.    - **Incorrect Condition Evaluation**: Determines if the `br_if` instruction fails to branch when the condition is true or branches incorrectly.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 1))
    (func $test-loop
      (block $outer
        (loop $inner
          (global.get $g)
          (br_if $inner (i32.eqz))
        )
      )
    )
  )
  "type mismatch"
)