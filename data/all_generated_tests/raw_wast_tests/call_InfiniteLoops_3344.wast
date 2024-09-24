;; 3. **Test Description**:    Implement a function that calls another function using an incorrect function index. Include a loop that perpetually calls this function. The test should identify an infinite loop if the index is not validated and causes an invalid reference error.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $type-out-of-bounds-func-idx
      (loop (call 2 (i32.const 0)))
    )
    (func (param i32))
  )
  "unknown function"
)