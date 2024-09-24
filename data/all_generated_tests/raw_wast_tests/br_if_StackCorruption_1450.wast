;; 1. **Test Description**: Create a test where a `br_if` instruction tries to branch to a label that is out of bounds. This should explicitly cause an `OobLabel` error in `wizard_engine` if the label index exceeds the depth of nested blocks, while WASM should handle this with a generic error.   - **Constraint Being Checked**: Label index is within valid bounds.   - **Stack Corruption Aspect**: Handling an out-of-bounds label incorrectly may result in the stack being unwound to an incorrect height, leading to underflows or overflows.

(assert_invalid
  (module
    (func $test-br_if-oob-label
      (block 
        (loop 
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "invalid label"
)