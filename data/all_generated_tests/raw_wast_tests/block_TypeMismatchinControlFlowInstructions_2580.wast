;; 1. Test a `block` that assumes an incorrect result type (`i32`) but contains instructions producing a value of type `f64`. This checks if the implementation correctly enforces the block's result type.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (f64.const 1.0)
    )
  ))
  "type mismatch"
)