;; 7. Implement an `unreachable` instruction inside an `if` block returning a `f32`, but provide instructions that produce `i32` instead. Test if the engines correctly catch the type mismatch.

(assert_invalid
  (module (func $type-if-value-i32-vs-f32
    (if (result f32) (i32.const 0) (then (unreachable)) (else (i32.const 1)))
  ))
  "type mismatch"
)