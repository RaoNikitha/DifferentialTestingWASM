;; 5. **Duplicate Table Entries**:    - Test a `call_indirect` with a table containing duplicate function references, ensuring correct function resolution without erroneous trapping.    - This test ensures that table content is managed correctly and functions are resolved distinctly.    - It relates to `br_table` by emphasizing the need for distinguishing among potentially repeated entries or targets.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $f1 (param i32) (result i32) (local.get 0))
    (func $f2 (param i32) (result i32) (i32.const 42))
    (table 2 funcref (elem $f1 $f1 $f2))
    (func (param i32) (result i32)
      (call_indirect (type 0) (local.get 0))
    )
  )
  "duplicate table entries"
)