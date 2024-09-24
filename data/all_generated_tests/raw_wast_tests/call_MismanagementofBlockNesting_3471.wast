;; 10. **Deep Nesting with Complex Exit Conditions and Function Calls**:    - Use deeply nested blocks with complex exit conditions (`br_if`, `br_table`) containing function calls. Ensure the flow correctly resumes post calls.    - Assess whether function index parsing interacts with control flow leaving the correct block or loop.  These tests are designed to uncover mismanagement of block nesting and control flow inconsistencies due to differences in how the `call` instruction is implemented across WebAssembly and the wizard_engine. They focus on ensuring that function calls respect nested control structures and return correctly, avoiding common pitfalls in indexing and execution state.

(assert_invalid
  (module
    (func $deep_nest_complex_exit
      (block
        (loop
          (block
            (br_if 1 (i32.const 0))
            (call 0 (i32.const 42))
            (call 1)
          )
          (call 2)
          (br_if 0 (i32.const 1))
        )
      )
    )
    (func (param i32))
    (func)
    (func)
  )
  "type mismatch"
)