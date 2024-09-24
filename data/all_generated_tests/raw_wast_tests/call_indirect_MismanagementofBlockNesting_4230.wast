;; 9. **Test Description**: A Wasm module with `call_indirect` placed in a deeply nested block-lambda construct, with a `br_table` designed to jump out of multiple lambda expressions, ensuring function type conformity and control flow.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (type 1) i32.const 1 return)
    (func
      (block
        (loop
          (br_table 1 0 0 
            (call_indirect (type 0) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)