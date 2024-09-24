;; 6. **Test 6: Mismatched `br` after Nested Function Calls and Returns**    - **Description:** Design a block that calls multiple functions, followed by a `br` instruction targeting a different block with mismatched operand stack expectations. Validate operand stack unwinding.    - **Reasoning:** Evaluates how successive function calls interact with block nesting and stack management when branching.

(assert_invalid
  (module
    (func $mismatched-br-after-function-calls
      (block
        (i32.const 42)
        (call $dummy_func1)
        (call $dummy_func2)
        (block (result i32)
          (br 1)
        )
      )
    )
    (func $dummy_func1)
    (func $dummy_func2 (result i32) (i32.const 0) (return))
  )
  "type mismatch"
)