;; 1. **Conditional Branch Always True**:    - Define a block containing a `br_if 0` instruction that branches based on a condition expected to be false (e.g., `i32.const 0`). Check if the block behaves correctly without branching to the end.        Constraints: This test checks if the `br_if` correctly evaluates the condition to false and prevents incorrect branching out of the block.

(assert_invalid
  (module
    (func $conditional-branch-always-true 
      (block (result i32)
        (br_if 0 (i32.const 0))
        (i32.const 1)
      )
    )
  )
  "unreachable"
)