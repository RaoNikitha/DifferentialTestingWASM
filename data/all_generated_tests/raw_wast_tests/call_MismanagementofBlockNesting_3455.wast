;; 4. **Deeply Nested Function Calls**:    - **Test Description**: Develop a function with multiple nested blocks, where each block calls another function. Ensure the calls propagate results back correctly, even when multiple blocks and loops are involved.    - **Constraint Checked**: Correct handling of results and argument stack under heavy nesting.    - **Relation to Mismanagement of Block Nesting**: Verifies the robustness of nested function call handling.

(assert_invalid
  (module
    (func $deeply-nested-calls
      (block
        (call $func1) ; Block 1
        (block
          (call $func2 (call $func3)) ; Block 2 with inner call
          (block
            (call $func4) ; Block 3
            (loop
              (call $func5) ; Loop inside block
            )
          )
        )
      )
    )
    (func $func1 (param i32) (result i32) (i32.const 0))
    (func $func2 (param i32) (result i32) (i32.const 1))
    (func $func3 (param i32) (result i32) (i32.const 2))
    (func $func4 (param i32) (result i32) (i32.const 3))
    (func $func5 (param i32) (result i32) (i32.const 4))
  )
  "type mismatch"
)