;; 2. **Test 2: Mismatched Label Arity with Indirect Function Call**    - Use `br_table` with mismatched label arity where some labels lead to `call_indirect` instructions. Ensure that the type-checking for indirect function calls correctly identifies the mismatch and does not execute unintended code.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (call_indirect (type 0) (i32.const 1) (local.get 0))
        (br_table 0 1 (i32.const 1) (local.get 0))
      )
    )
    (type (func (param i32) (result i64))) ;; Type mismatch here.
  ))
  "type mismatch"
)