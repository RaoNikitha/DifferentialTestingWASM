;; 2. **Test Description**:    - Implement a sequence where `br_if` evaluates a condition that determines whether a valid or an out-of-bounds table index is used by `call_indirect`. Ensure `br_if` correctly determines the validity of the index, checking for appropriate boundary conditions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $br_if-test (param i32) (result i32)
      (block $exit
        (br_if $exit (i32.gt_s (local.get 0) (i32.const 0)))
        (call_indirect (type 0) (i32.const 2) (local.get 0))
      )
      (i32.const -1)
    )
  )
  "index out of bounds"
)