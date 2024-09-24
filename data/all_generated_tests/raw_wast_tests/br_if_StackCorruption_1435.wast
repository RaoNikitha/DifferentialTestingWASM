;; Test with a `block` that has a `br_if` conditional within it. After unwinding the stack for the `br_if`, there should still be a valid operand stack matching the initial requirements of the `block`.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 2)
        (i32.const 1)
        (i32.const 0)
        (br_if 0 (local.get 0))
        (drop)
      )
    )
  )
  "type mismatch"
)