;; 3. **Block with Function Return Directly:**    - **Test Description:** Create a block that includes a function return (`return`) instruction, testing if the return correctly exits the current function context and resumes appropriately.    - **Constraint Checked:** Correct exit from nested context and stack unwinding due to a `return`.    - **Relation to Improper Function Handling:** Ensure the return instruction handles stack frames correctly within nested blocks.

(assert_invalid
  (module (func $block-with-function-return (result i32)
    (block (result i32)
      (i32.const 42)
      (return)
      (i32.const 0)
    )
  ))
  "type mismatch"
)