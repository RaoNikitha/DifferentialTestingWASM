;; 7. **Nested Blocks with Invalid Branch Depth and Unreachable**:    Create nested blocks with invalid branch depths, followed by `unreachable` instructions to test if `wizard_engine` mishandles branch depths.     ```wasm    block (result i32)       block (result i64)          block             br 3             unreachable          end       end       i32.const 0    end    ```     **Constraint**: This checks for correct branch depth calculation, preventing execution flow to `unreachable` due to invalid depths.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i64)
        (block
          (br 3)
          unreachable
        end)
      end)
      i32.const 0
    end)
  ))
  "unknown label"
)