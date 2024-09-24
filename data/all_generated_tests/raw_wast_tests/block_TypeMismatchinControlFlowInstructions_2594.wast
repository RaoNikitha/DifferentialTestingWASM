;; 5. **Test 5**: Compose a `block` where an `i32` to `f64` conversion is expected from the blocktype, but the final instruction before the `end` does not perform this conversion. The test ensures that the result type of blocks is strictly verified.

(assert_invalid
  (module (func $type-i32-to-f64 (result f64)
    (block (result f64) (i32.const 42) (end))
  ))
  "type mismatch"
)