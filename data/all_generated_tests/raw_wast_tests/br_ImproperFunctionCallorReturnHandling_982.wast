;; 3. **Test: Indirect Function Call with Type Mismatch**    - **Description**: Design a scenario where a `call_indirect` instruction attempts to call a function with an incorrect signature. Ensure the called function includes a `br` instruction that tries to branch to an invalid label due to the type mismatch in the function signature.    - **Constraint Checked**: Verifies proper type checking and function table lookup for indirect calls.    - **Improper Handling Aspect**: Incorrect handling of `call_indirect` causing unintended execution.

(assert_invalid
 (module
  (type $sig (func (param i32) (result i32)))
  (table funcref (elem $fn))
  (func $fn (param i32) (result i32)
   (block (br 1) (i32.const 0))
  )
  (func (param i32) (result i32)
   (call_indirect (type $sig) (local.get 0) (i32.const 1))
  )
 )
 "type mismatch"
)