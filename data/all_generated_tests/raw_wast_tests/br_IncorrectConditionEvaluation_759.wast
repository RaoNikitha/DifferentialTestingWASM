;; Test 10: Create a WebAssembly module where a `br_if` is used within a nested `loop`. The condition should check if an index variable is strictly positive. Test with negative and zero values to ensure it does not branch incorrectly, verifying accurate positive condition evaluation.

(assert_invalid
  (module
    (func $test
      (local $index i32)
      (loop $loop
        (local.get $index)
        (i32.const 0)
        (i32.gt_s)
        (br_if $loop (local.get $index))
      )
    )
  )
  "type mismatch"
)