;; 7. **Unreachable Code Paths**: Include a nested block with branches leading to code paths that should be unreachable. This tests if `wizard_engine` can handle unreachable target resolutions correctly.

(assert_invalid
  (module (func $unreachable-block-test (result i32)
    (block (result i32)
      (block (br 0 (i32.const 42)))
      unreachable
      (i32.const 10)
    )
  ))
  "type mismatch"
)