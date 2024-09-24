;; 2. **Test Description**: Implement a loop that performs a `call_indirect` to multiple functions indexed in a table. Each function should return varying integer values. Ensure the loop exits based on a predicate using the returned values from `call_indirect`.    **Constraint Checked**: Correct indirect function calling and table indexing in loops.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table funcref (elem $f1 $f2 $f3))
    (func $f1 (type $t) (i32.const 1))
    (func $f2 (type $t) (i32.const 2))
    (func $f3 (type $t) (i32.const 3))
    (func (param i32) (result i32)
      (local.get 0)
      (loop (param i32) (result i32)
        (call_indirect (type $t) (local.get 0))
        (i32.eqz)
        (br_if 0 (local.get 0))
        (local.get 0)
      )
    )
  )
  "type mismatch"
)