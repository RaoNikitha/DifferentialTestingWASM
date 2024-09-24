;; Develop a loop where nested loops contain `call_indirect` instructions. The outer loop should conditionally branch depending on the result of the inner loop's function call. This tests the handling of complex nesting and proper management of return values through multiple layers of loops.

(assert_invalid
  (module
    (type $sig_i_i (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (local.get 0))
    (func (result i32)
      (local i32)
      (loop (result i32)
        (loop (result i32)
          (call_indirect (type $sig_i_i) (i32.const 0) (i32.const 1))
          (br_if 1 (i32.const 0))
        )
        (br_if 0 (i32.const 1))
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)