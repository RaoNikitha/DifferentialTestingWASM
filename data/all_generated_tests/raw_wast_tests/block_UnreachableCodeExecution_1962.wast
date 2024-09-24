;; 3. **Forward Branch with Block Type Mismatch and Unreachable**:    Test an incorrect forward branch to a block with a mismatched block type and followed by an `unreachable` instruction. This checks if `wizard_engine` fails to handle forward branches correctly.     ```wasm    block (result i32)       block (result i64)          br 1          unreachable       end       i32.const 0    end    ```     **Constraint**: This verifies proper label indexing and block type handling for forward branches, ensuring control flow correctness.

(assert_invalid
  (module (func $forward-branch-blocktype-mismatch-unreachable
    (block (result i32)
      (block (result i64)
        (br 1)
        unreachable
      )
      i32.const 0
    )
  ))
  "type mismatch"
)