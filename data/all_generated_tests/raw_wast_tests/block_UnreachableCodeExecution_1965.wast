;; 6. **Overlapping Branches with Block Type Mismatches and Unreachable**:    Test overlapping branches with mismatched block types within nested blocks, containing an `unreachable` in the path of an incorrect branch. This checks if `wizard_engine` properly handles overlapping branch contexts.     ```wasm    block (result i32)       block (result i64)          br 1          block             br 0             unreachable          end       end       i32.const 0    end    ```     **Constraint**: This verifies the consistency of branch handling overlapping block contexts without reaching `unreachable`.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i64)
        (br 1)
        (block
          (br 0)
          unreachable
        end)
      end)
      i32.const 0
    end)
  ))
  "type mismatch"
)