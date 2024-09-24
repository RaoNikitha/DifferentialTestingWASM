;; 6. **Test with Function Call Chains**:    - **Description**: Create a sequence of `call` instructions that form a chain of function calls.    - **Constraint**: Checks that each function correctly calls the next in sequence.    - **Relation to Incorrect Branch Target Resolution**: Any missteps in index resolution can cause a break in the call chain, leading to misdirected control flow.

(assert_invalid
  (module
    (func $f1)
    (func $f2 (call $f1))
    (func $f3 (call $f2))
    (func $f4 (call $f3))
    (func $type-mismatch (call $f4 (i32.const 42)))
  )
  "type mismatch"
)