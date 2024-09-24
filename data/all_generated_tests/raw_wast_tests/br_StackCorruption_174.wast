;; 5. **Test Description:**    - Develop a sequence that involves multiple calls and returns, integrating `br` instructions in between to target blocks established in different calls. Test for correct stack unwinding and verify that function return values are not corrupted due to improper branch handling.

(assert_invalid
  (module
    (func $complex_branching
      (block $outer
        (block $inner
          (call $nested_call)
          (br $outer)
        )
      )
    )
    (func $nested_call
      (block
        (call $invalid_return)
      )
    )
    (func $invalid_return (i32.const 0))
  )
  "unknown label"
)