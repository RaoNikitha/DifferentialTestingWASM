;; Test Description 7: Formulate a function that catches and rethrows an exception as part of its logic. Call this function and observe if exception handling and stack states are consistent across implementations. Variations may reveal stack corruption during error propagation.

(assert_invalid
  (module
    (type $catch-rethrow-type (func))
    (func $catch-rethrow (type $catch-rethrow-type)
      (try
        (do
          (call $throwing-func)
        )
        (catch_all
          (rethrow 0)
        )
      )
    )
    (func $throwing-func (unreachable))
    (func (call $catch-rethrow))
  )
  "unexpected token"
)