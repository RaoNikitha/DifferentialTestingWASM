;; 8. Construct a loop that allocates memory, followed by a call to an imported function that also performs memory operations within its loop, then verify memory consistency post-call.

(assert_invalid
  (module
    (memory 1)
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (i32.const 0) ;; initializing memory index
      (i32.store) ;; storing initial value in memory
      (loop (result i32) ;; loop to allocate memory and call external func
        (i32.const 1)
        (i32.add)
        (call $external_func) ;; external function call within loop
        (br_if 0)
      )
      (i32.load) ;; load value from memory
    )
  )
  "type mismatch"
)