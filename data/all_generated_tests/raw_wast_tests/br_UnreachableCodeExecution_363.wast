;; 4. **Test Description:** Construct nested blocks with operand stack management. Use a `br` instruction targeting an outer block and insert an `unreachable` instruction in the path afterward. Validate correct unwinding of the operand stack.     - **Constraint Checked:** Operand stack unwinding and management during branching.     - **Relation to Unreachable Code Execution:** Ensures branch unwinds the stack correctly and avoids the `unreachable` instruction.

(assert_invalid
  (module
    (func $test-operand-management
      (block (result i32)
        (block (result i32)
          (i32.const 42)
          (br 1)
          (unreachable)
        )
        (i32.const 0)
      )
      (drop)
    )
  )
  "type mismatch"
)