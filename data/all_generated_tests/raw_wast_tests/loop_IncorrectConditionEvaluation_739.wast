;; 10. **Test for Loop with Conditional Branching and Side Effects**    - **Description**: Construct a loop where a `br_if` instruction should only branch if a local variable is modified within the loop, ensuring all instructions before the branch are executed in sequence.    - **Constraint Checked**: Validates conditional evaluations after side effects.    - **Incorrect Condition Evaluation**: Detects if the loop incorrectly branches before side effects are applied.

(assert_invalid
  (module
    (func $test-loop-br_if-side-effect
      (local $var i32)
      (i32.const 1)
      (local.set $var)
      (loop $loop (result i32)
        (local.get $var)
        (i32.eqz)
        (br_if $loop)
        (i32.const 2)
        (local.set $var) ;; This is the side effect before branching
      )
    )
  )
  "type mismatch"
)