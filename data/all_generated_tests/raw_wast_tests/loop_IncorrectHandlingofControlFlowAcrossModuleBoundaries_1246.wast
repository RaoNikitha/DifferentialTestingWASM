;; 7. **Test: Loop with Indirect Branch Table to Exported Functions**    Description: Create a loop that uses an indirect branch table (`br_table`) to dispatch calls to multiple exported functions. Verify that control flow and stack operations are correctly managed when functions return to the loop.    Constraints:    - Ensure correct dispatch through the indirect branch table.    - Validate parameter and result consistency across module boundaries.    - Confirm correct execution and resumption within the loop.

(assert_invalid
  (module
    (func $f1 (result i32) i32.const 1)
    (func $f2 (result f64) f64.const 2.0)
    (func (param i32)
      (result i32)
      (loop (result i32)
        (br_table 0 0 0 (local.get 0))
        (call $f1)
        (drop)
        (br 1))
      (call $f2)
      (br 1)
      (end))
    (export "main" (func 2))
  )
  "type mismatch"
)