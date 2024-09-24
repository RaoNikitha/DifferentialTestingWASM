;; 1. **Nested Block Misinterpretation with Unreachable Instruction**:    Test a nested block where the inner block's blocktype has a mismatch, and include an `unreachable` instruction after an incorrect branch. This will check if the `wizard_engine` misinterprets the block type, causing the control flow to erroneously hit the `unreachable` instruction.        ```wasm    block (result i32)       block (result i64)          br 1          unreachable       end       i32.const 0    end    ```     **Constraint**: This test checks for proper type handling and branching within nested blocks, ensuring that the branch correctly targets the outer block and avoids hitting the `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-block-misinterpretation-with-unreachable (result i32)
      (block (result i32)
        (block (result i64)
          (br 1)
          unreachable
        end)
        i32.const 0
      end)
    )
  )
  "type mismatch"
)