;; 9. **Test Description**: Implement a `call` using manipulated global indices, followed by a `br_table` with intentionally swapped targets, including invalid jumps. Observe if both engines trap or misbehave differently.    - **Reasoning**: Tests robustness against incorrect global indices and if dynamic jumps handle it correctly.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $manipulate-global-index
      (global.set $g (i32.const 100))
      (call $call-invalid-index)
    )
    (func $call-invalid-index)
    (func $main
      (call $manipulate-global-index)
      (br_table 1 2 (i32.const 1))
    )
  )
  "unknown function"
)