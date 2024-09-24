;; Design a loop with nested `call_indirect` that uses a table with the correct type size but contains out-of-bounds indices, testing different error handling properties between the two implementations.

(assert_invalid
  (module
    (table 10 funcref)
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32) (local.get 0))
    (elem (i32.const 0) $f)
    (func $type-call-indirect-loop
      (loop (result i32)
        (call_indirect (type $sig) (i32.const 20) (i32.const 0))
      )
    )
  )
  "element does not reference a function"
)