;; 4. Blocktype with Nested Function Calls: Use an `if` with nested function calls to observe stack behavior. ```wasm // Example (func $nested (result i32)   (if (result i32)     (then call $some_function)     (else i32.const 5)   ) ) ``` *Reasoning*: Tests if nested calls within `if` correctly balance the stack, preventing corruption from improper function return type handling.

(assert_invalid
  (module
    (type $func_type (func (result i32)))
    (func $some_function (type $func_type) (i32.const 10))
    (func $nested (result i32)
      (if (result i32)
        (then (call $some_function))
        (else (i32.const 5))
      )
    )
  )
  "type mismatch"
)