;; 3. **Branch Without Condition**:    - Use `br 0` inside a nested block structure. Validate that it always causes a branch, thereby testing the difference in unconditional and conditional branch handling.        Constraints: Checks if unconditional branches are properly implemented without depending on any condition.

(assert_invalid
  (module (func $branch-without-condition
    (block (result i32)
      (block
        (br 0) (unreachable)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)