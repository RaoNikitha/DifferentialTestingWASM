;; Test 8: Define a function that uses a mix of `br_if` and unconditional `br` instructions based on varying stack values. Observe if incorrect condition evaluations lead to different branching paths and function calls in both implementations.

(assert_invalid
  (module
    (func $test-func (param i32) (result i32)
      (local i32)
      (block $label1
        (br_if $label1 (i32.eqz (local.get 0)))
        (br $label1)
      )
      (call 0)
      (i32.const 1)
    )
    (func $called-func (result i32)
      (i32.const 42)
    )
    (start 0)
  )
  "type mismatch"
)