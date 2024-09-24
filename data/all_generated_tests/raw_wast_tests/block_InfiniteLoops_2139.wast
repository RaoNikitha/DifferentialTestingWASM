;; 10. **Test Description**: Use a sequence of `block`, `loop` instructions with conditions misconfigured to stay within the `loop`, ensuring correct escape conditions are checked.     - **Constraint**: Examines proper control flow to verify conditions and block type accurately ensure loop termination.

(assert_invalid
  (module (func $loop-escape-condition
    (block (loop (br_if 0 (i32.const 1)))) (br 1))
  )
  "unexpected branch"
)