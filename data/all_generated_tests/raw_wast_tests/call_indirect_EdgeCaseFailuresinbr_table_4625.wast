;; 4. **Out of Bounds Function Index**:    Provide a function index greater than the number of available functions in the table for the `call_indirect` instruction. This will ascertain if out-of-bounds indices are properly trapped. `br_table` also needs robust boundary checks to ensure valid index referencing.

(assert_invalid
  (module
    (type (func (param i32) (result i32))) 
    (table funcref (elem 0))
    (func $out-of-bounds-index 
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "out of bounds function index"
)