;; 1. **Test of Function Call within Nested Blocks**:     - Design a WebAssembly module where a function call is embedded within nested blocks (`block` and `loop`). Use `br_table` to exit these blocks conditionally, ensuring the function is called only when certain conditions are met.    - *Constraint*: This will check if the implementation correctly manages function scope and proper dealing of nested block exits using `br_table`.    - *Relation to Improper Function Call or Return Handling*: Ensures that function calls respect the context they are declared in, preventing unintended calls or returns due to mismanaged `br_table` branches.

(assert_invalid
  (module (func $nested-function-call
    (block (loop
      (call 0) 
      (br_table 0 (i32.const 1))
    ))
  ))
  "unknown function"
)