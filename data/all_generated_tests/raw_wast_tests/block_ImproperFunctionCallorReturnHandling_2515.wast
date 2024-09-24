;; Formulate a block that includes an iteration of `call_indirect` instructions to different functions from a function table, mix incorrect type match for one of the calls, ensuring robust type-checking across multiple indirect calls within a single block context.

(assert_invalid
  (module
    (type $i32_to_i32 (func (param i32) (result i32)))
    (func $func1 (param i32) (result i32) (i32.const 42))
    (table 10 funcref)
    (elem (i32.const 0) $func1)
    (func (result i32)
      (block (result i32)
        (call_indirect (type $i32_to_i32) (i32.const 0) (i32.const 1))
        (call_indirect (type $i32_to_i32) (i32.const 0) (f64.const 1.0))
      )
    )
  )
  "type mismatch"
)