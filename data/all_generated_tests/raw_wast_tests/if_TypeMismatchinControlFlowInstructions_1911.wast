;; Test a WebAssembly function with nested `if` instructions where the outer `if` is expecting an `i32` on the stack while the inner `if` is supposed to output an `f32`, causing a type mismatch in the outer `if` branch. This tests if the implementations can properly propagate and validate type constraints through nested control flow.

(assert_invalid
  (module
    (func $nested-type-mismatch
      (if (result f32)
        (i32.const 1)
        (then
          (if (result f32)
            (f32.const 0.0)
          )
        )
      )
    )
  )
  "type mismatch"
)