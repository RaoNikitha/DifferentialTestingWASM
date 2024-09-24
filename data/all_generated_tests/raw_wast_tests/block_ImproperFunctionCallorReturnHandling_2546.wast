;; 7. **Nested Blocks with Sequential Function Calls:**    - **Test Description:** Construct multiple nested blocks where each block includes a separate function call, which are executed sequentially.    - **Constraint Checked:** Proper execution order and label indexing across nested blocks with multiple function calls.    - **Relation to Improper Function Handling:** Verify continuous correct function call execution and control flow management in nested contexts.

(assert_invalid
  (module (func $test-nested-blocks-sequential-calls (result i32)
    (block (result i32) 
      (block (result i32) 
        (call 0) 
        (call 1) 
        (br 1 (i32.const 42))
      )
      (br 0 (i32.const 21))
    )
  ))
  "type mismatch"
)