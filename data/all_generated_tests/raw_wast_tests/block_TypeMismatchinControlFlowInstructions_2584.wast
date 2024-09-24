;; 5. Write a `block` with a `typeidx` that expects multiple `i32` values but contains a mix of `i32` and `f64` instructions, ensuring that the function type indexing detects the inconsistency.

(assert_invalid
  (module (func $block-with-typeidx-mixed-types
    (block (type 0) (br 0 (i32.const 1) (f64.const 3.14) (i32.const 2)))
  ))
  "type mismatch"
)