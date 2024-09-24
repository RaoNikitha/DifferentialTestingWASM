;; 1. **Test Description**: A loop block that includes an `if` instruction that leads to an `unreachable` instruction when executed, depending on a conditional branch. Specifically, an incorrect nesting of these instructions in the context where a branch always incorrectly targets the `unreachable` code:    - **Constraint Checked**: Proper nesting and correct branch targeting.    - **Unreachable Code Execution**: Misinterpretation of labels could result in the branch jumping to the `unreachable` instead of a valid target.

(assert_invalid
  (module
    (func $invalid-nesting-target
      (i32.const 1)
      (loop (param i32) 
        (if 
          (i32.const 0) 
          (then (br 0)) 
          (else (unreachable))
        )
      )
    )
  )
  "type mismatch"
)