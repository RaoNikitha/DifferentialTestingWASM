;; 2. **Test 2**: Create a nested `block` structure where an enclosing block calls an indirect function using `call_indirect`. Ensure the function index is misaligned to test type checking and function resolution differences.

(assert_invalid
  (module
    (func $nested-blocks-call-indirect
      (block (result i32)
        (block (result i32)
          (call_indirect (type 0) (i32.const 1) (i32.const 0))
        )
      )
    )
    (type (func (param i32) (result i32)))
  )
  "type mismatch"
)