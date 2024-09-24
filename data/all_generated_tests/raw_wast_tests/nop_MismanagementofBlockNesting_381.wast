;; 2. **Test nested `if-else` blocks with `nop`:** Construct a nested `if-else` scenario where `nop` is embedded within various branches. Validate that the correct branch is executed and the stack remains unaffected. This checks if `nop` placement is causing incorrect control flow exit due to improper validation context resets.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (if (i32.const 1)
        (then (nop))
        (else (block (nop)))
      )
      (local.get 0)))
  "type mismatch"
)