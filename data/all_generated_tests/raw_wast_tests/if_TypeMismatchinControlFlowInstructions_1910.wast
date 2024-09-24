;; 1. Test a WebAssembly module where an `if` block is expected to output an `i32` type, but the instructions within the `then` section output an `f32` type and the instructions within the `else` section output an `i32` type. This checks whether both code implementations enforce type matching between branches.

(assert_invalid
  (module
    (func $test-type-mismatch-if
      (result i32)
      (i32.const 1)
      (if (result i32)
        (then (f32.const 1.0))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)