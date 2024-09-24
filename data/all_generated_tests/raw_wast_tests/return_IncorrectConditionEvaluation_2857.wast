;; 6. Implement `br_if` within a function that calls another which returns a value used in the condition, ensuring precise condition evaluation across function calls. Failures will trigger a mispattern.

(assert_invalid
  (module
    (func $incorrect-br_if (result i32)
      (br_if 0 (call $value-producing-function))
      (return)
    )
    (func $value-producing-function (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)