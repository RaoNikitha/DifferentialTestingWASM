;; 1. Test a function that calls another function which itself has an erroneous call to a third function and then returns a value pertinent to this incorrect sequence. This checks if the implementations handle nested function call errors correctly.

(assert_invalid
  (module
    (func $inner (param i32) (result i32)
      (local.get 0)
      (call $incorrect)
      (return)
    )
    (func $outer (param i32) (result i32)
      (call $inner (local.get 0))
    )
  )
  "unknown function"
)