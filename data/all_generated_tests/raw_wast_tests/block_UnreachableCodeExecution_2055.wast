;; 6. **Test 6: Early Unreachable within Block**    - **Description**: Implement a block where the first instruction is `unreachable`, followed by valid instructions. Ensure testing whether subsequent instructions are ignored.    - **Constraint**: Tests immediate termination of blocks containing an initial `unreachable` instruction.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      unreachable
      i32.const 42
      )
    )
  )
  "type mismatch"
)