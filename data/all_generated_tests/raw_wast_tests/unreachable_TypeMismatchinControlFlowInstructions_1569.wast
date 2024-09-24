;; 10. **Test 10: Unreachable in Polymorphic Context Causing Type Discrepancies**     - Using the polymorphism of `unreachable` to introduce type conflicts within instructions like `call` or parameterized blocks, ensuring these contexts correctly accommodate the stack-polymorphic nature.     - **Constraint Checked:** Verifies that stack polymorphism adheres to polymorphic contexts in control flow, especially for parameterized scenarios involving `unreachable`.  These tests aim to identify potential misinterpretations of the type constraints and their consistent enforcement across different WebAssembly environments, focusing on the correct handling of the `unreachable` instruction and its integration within control flow structures.

(assert_invalid
  (module
    (func (result i32)
      (call $some_func)
      (unreachable)
      (i32.add (i32.const 10) (i32.const 20))
    )
    (func $some_func (result i64)
      (f64.const 1.0)
    )
  )
  "type mismatch"
)