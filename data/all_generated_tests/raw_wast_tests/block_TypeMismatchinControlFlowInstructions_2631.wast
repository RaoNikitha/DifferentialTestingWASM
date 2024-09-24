;; 2. **Test Description**: Design a `block` with a `valtype?` output of `i64`, but the nested instructions only produce an `i32` value. Validate if the implementation catches the mismatch between expected and produced types upon block termination.

(assert_invalid
  (module (func $type-mismatch-block-result (result i64)
    (block (result i64) (i32.const 1) (br 0))
  ))
  "type mismatch"
)