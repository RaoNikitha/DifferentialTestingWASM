;; 3. **Test Description 3**:    Construct a loop where a function is repeatedly called with `call` and the function returns immediately via `return`. Check if the loop correctly continues execution without stack corruption after each return.

(assert_invalid
  (module
    (func $test (result i32)
      (local i32)
      (loop (result i32)
        (call $rec_func)
        (br_if 1 (local.get 0))
        (return (i32.const 0))
      )
    )
    (func $rec_func (result i32)
      (local.get 0)
    )
  )
  "stack corruption after return"
)