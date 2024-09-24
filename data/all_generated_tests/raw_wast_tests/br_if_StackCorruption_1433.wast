;; A nested `block` structure where the innermost block consumes an `f64`. Place a `br_if` in the innermost block targeting an outer block. Check that the stack unwinds correctly, leaving the `f64` in place when the branch is not taken.

(assert_invalid
 (module
  (func (result f64)
   (block (result f64)
    (f64.const 1.0)
    (block
     (br_if 1 (i32.const 0))
     (f64.const 2.0)
    )
   )
  )
 )
 "type mismatch"
)