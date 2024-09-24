;; 4. **Stack Manipulation leading to Unreachable**:    - Perform stack operations leading to a condition which evaluates an `if` block that ends with an `unreachable` instruction.    - **Constraint**: Maintains the operand stack height/type consistency during branching and unreachable instruction execution.

(assert_invalid
  (module
    (func $stack-manip-unreachable
      (if (i32.const 0) (then (nop)) (else (unreachable)))
    )
  )
  "unreachable"
)