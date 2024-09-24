;; Test a function call that provides incorrect types of arguments on the stack. This checks for type mismatch handling and whether the proper error is triggered for non-assignable types.

(assert_invalid
  (module
    (type (func (param i32 i64) (result i32)))
    (func (type 0)
      i32.const 42
      i32.const 42
      call 0
    )
  )
  "type mismatch"
)