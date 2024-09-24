;; Test nested function calls where each nested call consumes different types of arguments and returns different types of results. This checks for correct stack management across multiple function invocations.

(assert_invalid
  (module
    (type $func0 (func (param i32) (result i64)))
    (type $func1 (func (param i64) (result i32)))
    (func $nested1 (result i64)
      (call 1 (i64.extend_i32_u (i32.const 1)))
    )
    (func $nested2 (result i32)
      (call 0 (i32.wrap_i64 (call $nested1)))
    )
  )
  "type mismatch"
)