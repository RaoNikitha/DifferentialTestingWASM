;; 6. **Test 6**: Place a `block` that should return an `i32`, but inadvertently leave the result type implicit (`valtype?`). Verify if the type mismatch is successfully caught at runtime despite the implicitness.

(assert_invalid
  (module (func $type-implicit-return-type (result i32)
    (block (br 0 (i32.const 0)) (i32.const 1))
  ))
  "type mismatch"
)