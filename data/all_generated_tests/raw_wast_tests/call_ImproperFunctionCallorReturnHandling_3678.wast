;; 7. **Test Handling of Function Import/Export**:    - Execute `call` instructions referencing imported and exported functions to see if the context correctly locates and executes them.    - **Constraint**: Correct handling of the function index within imported/exported context.    - **Improper Call Handling**: Incorrect resolution could lead to calling the wrong function or crashes.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32)))
    (func $test-func (call $imported_func (i64.const 42)))
  )
  "type mismatch"
)