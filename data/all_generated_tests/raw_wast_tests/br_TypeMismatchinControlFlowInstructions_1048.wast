;; 9. Set up a module with multiple nested blocks where an inner `if` condition branch (`br`) exits to an outer block. Introduce a type mismatch by having the inner block adjust for `f64` while the outer expects `i64`. This tests proper type checks when unwinds span multiple structural layers.

(assert_invalid
  (module
    (func
      (block (result i64)
        (block
          (if (br 1 (f64.const 0.0)) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)