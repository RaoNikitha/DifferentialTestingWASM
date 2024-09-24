;; 9. **Test 9**: Utilize nested structures with an out-of-bounds `br_if` targeting label references in an inner block. Ensure that the consistent handling of errors for out-of-bound access is followed across implementations, confirming proper error management in nested contexts.

(assert_invalid
  (module
    (func (block (block (br_if 2 (i32.const 1)))))
  )
  "unknown label"
)