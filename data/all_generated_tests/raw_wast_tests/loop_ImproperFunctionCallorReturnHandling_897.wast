;; 8. **Loop with Call Instruction Affecting Outer Context**:    - Description: Define a loop where a `call` instruction inside the loop affects variables or state in an outer context that is subsequently used in a function call outside the loop.    - Constraint: Ensure the function calls within the loop do not incorrectly alter the outer context or state.    - Relation: Improper function call handling could cause state corruption or unintended behavior in outer contexts.

(assert_invalid
  (module
    (func $outer
      (local i32)
      (local.set 0 (i32.const 1))
      (loop (param i32) (call $inner (local.get 0)) (br 1))
      (call $use_outer (local.get 0))
    )
    (func $inner (param i32) (result i32) (i32.const 0))
    (func $use_outer (param i32))
  )
  "type mismatch"
)