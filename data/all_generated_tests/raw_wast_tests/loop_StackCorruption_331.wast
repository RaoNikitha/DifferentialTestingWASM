;; 2. **Test 2**:    - **Description**: Utilize a loop that branches to itself with a `br` instruction and consumes an excessive number of stack values.    - **Constraint**: Proper stack height maintenance when branching back to the loop start.    - **Stack Corruption Check**: Check for any stack overflows due to incorrect management during branching.

(assert_invalid
  (module
    (func $stack-overflow
      (i32.const 0) (i32.const 0) (i32.const 0)
      (loop (param i32 i32) (br 0) (unreachable))
    )
  )
  "stack overflow due to excessive values"
)