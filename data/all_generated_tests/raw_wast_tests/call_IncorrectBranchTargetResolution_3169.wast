;; 8. **Test Description**: Trigger a function call from within another function’s block containing a `br` to an out-of-bounds label, leading to a specific trap/error.    - **Constraint**: Ensures proper error handling for out-of-bounds branch targets post-function call.

(assert_invalid
  (module
    (func $f (param i32) (result i32)
      (block $l
        (br $l)
        (call $g (i32.const 1))
      )
    )
    (func $g (param i32) (result i32)
      (i32.const 1)
    )
    (type (func (param i32) (result i32)))
  )
  "unknown label"
)