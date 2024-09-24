;; 9. **Test Description**: Use a function comprising a conditionally recursive call controlled by a `br_if`. Always true bug in condition evaluation would force recursion indefinitely, demonstrating significant behavioral differences.

(assert_invalid
  (module
    (func $recursive-call (param i32)
      (local.get 0)
      (i32.const 1)
      (i32.eq)
      (br_if 0 (call $recursive-call (i32.const 1)))
    )
  )
  "type mismatch"
)