;; 5. A scenario where within an `if` block, an attempt is made to push an `i32` output in a context where the enclosing blocktype requires an `f32` output, causing a type inconsistency.

(assert_invalid
  (module (func $type-if-block-i32-vs-f32 (result f32)
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)