;; - Test 5: Develop a test where a function is called, with post-call branches determined through `br` inside loop constructs. Check if the branching instruction accurately targets the intended loop blocks.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $branch-test (param i32) (result i32)
      (local $result i32)
      loop $loop1
        (call 1 (local.get 0))
        (br_if $loop1 (local.get 0))
        (local.set $result (i32.const 1))
      end
      (local.get $result)
    )
    (func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)