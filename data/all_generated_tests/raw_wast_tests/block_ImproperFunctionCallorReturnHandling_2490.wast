;; 1. A `block` instruction contains a function `call_indirect` that indirectly calls a function through a table that includes different function types to validate correct indirect table lookup and type checking. This tests if the different engines handle type validation as specified with respect to indirect calls within a block.

(assert_invalid
  (module
    (table 1 funcref)
    (type $t (func (param i32) (result i32)))
    (func $f (type $t) (param i32) (result i32)
      (block (result i32)
        (call_indirect (type $t) (i32.const 0) (i32.const 42))
      )
    )
  )
  "type mismatch"
)