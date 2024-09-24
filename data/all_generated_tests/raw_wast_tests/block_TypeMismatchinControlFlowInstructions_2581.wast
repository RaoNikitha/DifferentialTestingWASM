;; 2. Construct a `block` with an annotation of `valtype?` as `[]` but include `i64` values in its body, verifying if the instruction sequence validation correctly identifies the type mismatch.

(assert_invalid
  (module (func $type-block-valtype-empty-includes-i64
    (block (result i32) (i64.const 1) (drop) (i32.const 1))
  ))
  "type mismatch"
)