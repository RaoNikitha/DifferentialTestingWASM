;; - Two nested functions where the inner function contains a `br_if` that conditionally breaks to an outer block and returns a value. The outer function calls the inner function and immediately returns the result. This differential checks if improper control transfer references in `br_if` affect the overall return value.

(assert_invalid
  (module
    (func $inner (result i32) 
      (block (result i32) 
        (i32.add 
          (i32.const 2) 
          (block (result i32) 
            (br_if 1 (i32.eqz (i32.const 0))) 
            (i32.const 3)))))
    (func $outer (result i32) 
      (call $inner)))
  "label index out of bounds"
)