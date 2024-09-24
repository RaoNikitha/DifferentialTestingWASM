;; 4. **Test 4: Import and Check Type-Matching with Conditional Branches**    - **Description**: Import a function and have conditional `br_if` executions leading to the function call. Establish that both implementations adhere to type-matching requirements for the operand stack, ensuring no inconsistencies during module interaction.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32) (result i32)))
    (func $type-imported-func-call
      (block (result i32)
        (br_if 0 (call $externalFunc (i32.const 10)) (i32.const 1))
      )
    )
  )
  "type mismatch"
)