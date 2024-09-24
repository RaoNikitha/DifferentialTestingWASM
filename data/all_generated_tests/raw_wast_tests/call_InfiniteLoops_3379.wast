;; 8. **Infinite Loop by Recursively Called Functions Modifying Call Indices**:    - **Description**: Construct a WebAssembly module in which recursively called functions modify a global variable used to determine function indices dynamically.    - **Reason**: Tests the correctness of handling dynamic function index resolution within infinite loops, focusing on index bounds and type consistency.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $increment (result i32)
      global.get $g
      i32.const 1
      i32.add
      global.set $g
      global.get $g)
    (func $loop (call_indirect (result i32) (param i32)
      (global.get $g))
    )
    (table 1 funcref)
    (elem (i32.const 0) $increment)
  )
  "type mismatch"
)