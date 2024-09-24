;; 9. **Test Description**: Construct a `block` with the terminating instruction being `br` that expects an `i32` but receives `i64` from the operand stack. This checks the validation accuracy of the type against branch operations.

(assert_invalid
  (module (func $type-mistmatch-i64-vs-i32 (result i32)
    (block (result i32) (br 0 (i64.const 42)))
  ))
  "type mismatch"
)