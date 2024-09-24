;; 6. Use `call_indirect` to index into a table having the right number of operands but include an out-of-bounds branch target inside the called function. This ensures that the `require` and conditional checks adequately catch inappropriate branch targets.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $callee (param i32) (result i32)
      (block (br 1)) ;; Invalid branch index
    )
    (table funcref (elem $callee))
    (func $caller
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "unknown label"
)