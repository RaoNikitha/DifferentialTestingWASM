;; **Test 1**: Create a WASM module with an indirect function call where the function index is outside the valid range of the table. This should test the bounds checking and ensure that the error handling for an invalid index works correctly between the implementations. Specifically check if the different error handling methods properly trap the out-of-bounds access and how an invalid CFG leads to inconsistencies.

(assert_invalid
  (module
    (type $sig (func))
    (table 1 funcref)
    (func $out_of_bounds_call (call_indirect (type $sig) (i32.const 1)))
  )
  "out of bounds table index"
)