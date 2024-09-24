;; Create a test where a `block` contains an `unwind` operation post an imported function call. Validate that unwinding and stack state preservation occur correctly after the function call and that control flow adheres to the block's defined boundaries across module boundaries.

(assert_invalid
  (module
    (import "env" "some_func" (func $some_func (param i32) (result i32)))
    (func $test (result i32)
      (block (result i32)
        (call $some_func (i32.const 0))
        (br 0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)