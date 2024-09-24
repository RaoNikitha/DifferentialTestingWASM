;; 3. **Mismatched Block Types with Indirect Function Call**:    - `if` block expects `[i32] -> [i64]`, but the `call_indirect` resolves to `[i32] -> [i32]` function.    - Check if error handling is consistent, ensuring the function signature mismatch is properly managed.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $expected (func (param i32) (result i64)))
    (table anyfunc (elem $func))
    (func $func (type $sig)
      (param i32) (result i32)
      (i32.const 42))
    (func (param i32) (result i64)
      (if (result i64) (i32.const 1)
        (then
          (call_indirect (type $expected) (local.get 0) (i32.const 0))
        )
        (else
          (i64.const 0)
        )
      )
    )
  )
  "type mismatch"
)
