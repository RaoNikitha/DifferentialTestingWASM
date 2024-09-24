;; 6. **Test Type Occurrences in Conditional Calls**:    Provide a series of function calls within an `if` statement that depend on specific type indices, ensuring that improper type handling leads to differential erroneous behavior in branch management.

(assert_invalid
  (module
    (type $ft (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      (if (result i32) (i32.const 1) 
        (then (call 0 (local.get 0)))
        (else (call 1 (local.get 0))))
    )
  )
  "type mismatch"
)