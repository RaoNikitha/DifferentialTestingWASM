;; 7. **Test Description**: Perform a function call within a loop where the function signature changes dynamically through a table, inspecting consistent type checks.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem 0 1 0))
    (func $f1 (param i32))
    (func $f2 (param i64))
    (func
      (loop $label
        (call_indirect (type 0) (i32.const 0) (i32.const 42))
        (br $label)
      )
    )
  )
  "type mismatch"
)