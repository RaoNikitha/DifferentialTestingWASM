;; 10. Write a WebAssembly module featuring a `loop` requiring an `i64` label type and include an inner block causing a `br` to this loop, but erroneously handling `f32` values instead. This evaluates how the engine deals with backward branches carrying mismatching types.

(assert_invalid
  (module
    (func
      (block
        (loop (result i64)
          (block
            (br 1 (f32.const 0.0))
          )
        )
      )
    )
  )
  "type mismatch"
)