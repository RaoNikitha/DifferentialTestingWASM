;; Test 6: Implement a function that calls a series of smaller functions, each returning a boolean condition. Use `br_if` to conditionally execute further branches based on the returned conditions.

(assert_invalid
  (module
    (type $boolFn (func (result i32)))
    (func $check1 (type $boolFn) (i32.const 1))
    (func $check2 (type $boolFn) (i32.const 0))
    (func $check3 (type $boolFn) (i32.const 1))
    (func $compute (result i32)
      (call $check1)
      (br_if 0 (call $check2))
      (call $check3)
    )
  )
  "type mismatch"
)