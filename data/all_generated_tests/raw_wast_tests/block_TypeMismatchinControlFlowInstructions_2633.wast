;; 4. **Test Description**: Construct a nested `block` where the outer block expects no output (`[]`), but the inner block provides an `f64` output. This aims to test whether the implementation correctly validates the type flow through nested blocks.

(assert_invalid
  (module (func
    (block
      (block (result f64) (f64.const 1.0))
      (drop)
    )
  ))
  "type mismatch"
)