;; 1. **Test for Function Index Out of Bounds with Infinite Loop**:    Create a WebAssembly function that uses `call_indirect` with an index that is deliberately out of bounds of the table and involves a `loop` instruction where the `br_if` condition is always true, leading to a potential infinite loop if the `call_indirect` implementation fails to trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32))
    (func (loop
      (call_indirect (type 0) (i32.const 2) (i32.const 0))
      br_if 0 (i32.const 1)
    ))
  )
  "out of bounds function index"
)