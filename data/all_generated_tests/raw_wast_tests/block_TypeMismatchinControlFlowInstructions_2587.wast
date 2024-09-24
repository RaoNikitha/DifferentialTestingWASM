;; 8. Create a nested control flow involving a `block` embedded in a `loop`, with the `loop` producing `f32` but the `block` expecting `i32`, testing type checking across nested control structures.

(assert_invalid
  (module (func $nested-loop-block-mismatch
    (loop (result f32)
      (block (result i32) 
        (br 1 (f32.const 1.0))
      )
    )
  ))
  "type mismatch"
)