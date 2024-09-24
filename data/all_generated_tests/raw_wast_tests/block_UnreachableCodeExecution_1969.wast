;; 10. **Improper Handling of Call within Blocks and Unreachable**:     Create a test where calling a function within improperly typed nested blocks leads to an `unreachable` post execution. Evaluates if `wizard_engine` correctly handles call instructions inside blocks.      ```wasm     (func $called (result i32)        i32.const 1     )     block (result i32)        block (result i64)           call $called           br 0           unreachable        end     end     ```      **Constraint**: This verifies the correctness of `wizard_engine` handling function call returns within blocks to prevent reaching `unreachable`.

(assert_invalid
  (module
    (func $called (result i32)
      i32.const 1)
    (func $test
      (block (result i32)
        (block (result i64)
          call $called
          br 0
          unreachable)
        end)
      end))
  "type mismatch")