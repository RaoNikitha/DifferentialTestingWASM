;; Develop a module where a callback function is used that changes the function table dynamically. Call a function via `call_indirect` within this dynamic context and check if both engines resolve to the correct function or misinterpret the function table updates.

(assert_invalid
  (module
    (type $callback (func))
    (func $changeTable
      ;; A function that hypothetically changes the function table
    )
    (func (type $callback)
      ;; A simple callback function
    )
    (table 1 funcref)
    (elem (i32.const 0) $changeTable)
    (func $indirectCaller
      (call $changeTable)
      (call_indirect (type $callback) (i32.const 0)) ;; Call using the updated table
    )
  )
  "unknown function"
)