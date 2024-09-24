;; 4. Design a sequence of nested blocks with multiple layers where the `call_indirect` uses an index from a `br_table` to select the target function. This sequence explores whether the depth is maintained correctly across the `br_table` index resolution.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $f0 (param i32))
    (func $f1 (param f32))
    (func (param i32)
      (block $outer
        (block $middle
          (block $inner
            (br_table $inner $middle $outer (local.get 0))
            (call_indirect (type 1) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)