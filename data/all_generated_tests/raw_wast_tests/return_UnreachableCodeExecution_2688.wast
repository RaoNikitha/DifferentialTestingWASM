;; Test 7: Design a test where a function makes a series of nested calls to other functions containing `unreachable` decorated inside deeply nested blocks, but all inner return calls effectively prevent the outermost from reaching these `unreachable`.

(assert_invalid
  (module
    (func $nested_return (result i32)
      (block
        (block
          (call $inner_func)
          (unreachable)
        )
        (return (i32.const 1))
      )
    )
    (func $inner_func (result i32)
      (block
        (block
          (return (i32.const 0))
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)