;; Implement a module where nested blocks contain mixed instructions (`call_indirect`, `br`, `br_if`). Introduce various depths and ensure the validations handle the mismatching of function types and table indices within nested structures.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (param i32 i32)
      (block
        (loop
          (i32.const 0)
          (br_if 0)
          (i32.const 0)
          (block
            (i32.const 1) 
            (call_indirect (type 1) (i32.const 0)) ; calls a function with type (param i32) (result i32) instead of (param i32 i32) (result i32)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)