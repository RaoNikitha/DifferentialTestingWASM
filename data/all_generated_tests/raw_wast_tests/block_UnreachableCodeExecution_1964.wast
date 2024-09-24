;; 5. **Branch Table with Incorrect Block Type and Unreachable**:    Construct a branch table targeting blocks of incorrect types, leading to an `unreachable` instruction if selected. This tests if `wizard_engine` processes branch tables accurately despite block type mismatches.     ```wasm    block (result i32)       block (result i64)          block (result f32)             i32.const 0             br_table 0 1 2             unreachable          end       end       i32.const 0    end    ```     **Constraint**: This evaluates whether branch tables respect block types and prevents reaching `unreachable`.

(assert_invalid
  (module
    (func
      block (result i32)
        block (result i64)
          block (result f32)
            i32.const 0
            br_table 0 1 2
            unreachable
          end
        end
        i32.const 0
      end
    )
  )
  "type mismatch"
)