;; 8. Create a WebAssembly module with a `loop` that declares an input type of `f32`. Use a branch instruction showing a type mismatch by pushing `i32` values to see how the engine handles backward branches for loops with incorrect operand types.

(assert_invalid
  (module
    (func $type-mismatch-loop
      (loop (param f32)
        (br 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)