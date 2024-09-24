;; 10. **Indirect Branching in Exception Handling Path**:     - Test Description: Use `br_table` in an exception handling path where an external function might throw an exception, ensuring control flows through the correct label vector and adheres to exceptional returns.     - Constraint: Validates `br_table` handling within an exception scenario when crossing module boundaries, assuring the stack remains intact.     - Differential Reasoning: `wizard_engine` might not handle exceptional returns correctly, leading to operand stack disruptions or incorrect control flow.

(assert_invalid
  (module
    (func $exception_handling (result i32)
      (try (result i32)
        (do
          (call $external_function)
          (br_table 0 1 (i32.const 1))
        )
        (catch
          (i32.const 2)
        )
      )
    )
    (func $external_function)
  )
  "exception handling not supported"
)