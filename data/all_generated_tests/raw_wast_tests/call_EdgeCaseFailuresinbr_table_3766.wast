;; 5. **Test Description**: Use a `call` specifying a function index followed by a `br_table` that jumps to different sections where one target rewrites a valid function type on a subsequent table entry. Validate if the function signature stays consistent.    - **Reasoning**: Ensures that the signature consistency is maintained statefully between the function invocations and `br_table` entries.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $invalid-call 
      (local i32)
      (local.set 0 (i32.const 10))
      (call 1)
      (br_table 0 1)
    )
    (func (param i64) (result i32) (local.get 0))
  )
  "type mismatch"
)