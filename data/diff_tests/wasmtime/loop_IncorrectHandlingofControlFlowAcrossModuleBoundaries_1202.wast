;; 3. **Test 3**:    - Description: Implement a loop that performs a backward branch (`br`) to its start after calling an exported function, which calls back into the module’s function.    - Specific Constraint: The backward branch and call return should maintain the stack’s integrity.    - Control Flow Relation: Verifies proper handling of the control flow across module boundaries when combined with loop backward branching.

(assert_invalid
  (module
    (func $callback (import "env" "callback"))
    (func (export "test")
      (loop (br 0) (call $callback))
    )
    (start 1))
  "type mismatch"
)