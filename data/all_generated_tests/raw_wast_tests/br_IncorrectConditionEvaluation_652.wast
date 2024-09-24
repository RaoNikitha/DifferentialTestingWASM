;; 3. **Condition Dependent on Stack Operation**:    - Design a test where the condition for a `br_if` depends on the result of a stack operation (e.g., addition of two numbers resulting in zero). Verify if the branch occurs correctly only when the condition is true, testing the proper evaluation and use of the operand stack in the conditional branch.

(assert_invalid
  (module
    (func $condition-stack-operation
      (block (result i32)
        (block (result i32)
          (i32.add (i32.const 1) (i32.const -1))
          (br_if 0 (i32.eqz))
        )
        (i32.add (i32.const 2) (i32.const 3))
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)