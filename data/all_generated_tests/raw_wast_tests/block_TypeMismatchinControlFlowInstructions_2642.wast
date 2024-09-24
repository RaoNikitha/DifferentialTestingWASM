;; 3. Construct a block where the expected type is `[]`, but the contained instructions try to push an `i32` type on the stack. This verifies if both implementations enforce the constraint of expecting no return values.

(assert_invalid
  (module (func $type-empty-vs-i32
    (block (result) (i32.const 1))
  ))
  "type mismatch"
)