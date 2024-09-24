;; 4. **Stack Unwinding with Unreachable in Loop**:    - Create a loop that attempts to unwind the stack and branch, ending with an `unreachable` instruction. Include various conditional branches that could trigger unwinding.    - **Constraint**: Verifies correct stack unwinding logic and branch execution within the loop to avoid hitting `unreachable`.    - **Unreachable Code Execution**: Confirms stack unwinding does not lead to `unreachable` due to improper branch handling.

(assert_invalid
  (module
    (func $stack-unwind-unreachable
      (block $label1 (loop $label2
        (br_if $label1 (i32.const 1))
        (br $label2)
        (unreachable)
      ))
    )
  )
  "stack unwinding with unreachable"
)