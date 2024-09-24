;; 10. Develop a scenario using variable manipulation where an incorrect reassignment or type mismatch eventually causes execution of `unreachable`. Validate if the engine’s error handling ensures execution control does not erroneously reach the `unreachable`.

(assert_invalid
  (module (func $test-variable-reassignment-type-mismatch 
    (local i32) 
    (local i64)
    local.get 0
    i64.const 0
    local.tee 0
    unreachable
  ))
  "type mismatch"
)