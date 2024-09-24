;; 4. **Complex Block Nesting with Mismatched Types and Unreachable**:    Use complex nested blocks with misaligned block types and include `unreachable` on invalid branches. This evaluates if `wizard_engine` mismanages complex nesting resulting in reaching `unreachable`.     ```wasm    block (result i32)       block (result i64)          block (result f32)             br 2             unreachable          end       end       i32.const 0    end    ```     **Constraint**: This checks for accurate interpretation of nested block types and proper handling of branch instructions to avoid `unreachable`.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i64)
          (block (result f32)
            br 2
            unreachable
          )
        )
        i32.const 0
      )
    )
  )
  "type mismatch"
)