;; 10. **Test Description:**    Implement an `if` instruction where the `then` block calls an exported function that performs multiple return operations. Verify that control is correctly transferred back to the calling module, maintaining appropriate stack status on true condition.

(assert_invalid
  (module
    (func $multi_return (export "multi_return") (param $x i32) (result i32)
      (if (result i32) (local.get $x)
        (then (return (i32.const 42)))
        (else (return (i32.const 13)))
      )
    )
    (func $test_if (result i32)
      (if (result i32) (i32.const 1)
        (then (call $multi_return (i32.const 1)))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)