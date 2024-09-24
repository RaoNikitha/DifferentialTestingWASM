;; 2. Construct a `call_indirect` instruction in a control block, such as within a `loop`, where the expected function type returns `[]`, but the called function is set to return `[i32]`. This targets the validation of return type consistency in nested control flow contexts.

(assert_invalid
  (module
    (type $func-type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (result i32) (i32.const 42))
    (func (loop
      (call_indirect (type $func-type) (i32.const 0))
    ))
  )
  "type mismatch"
)