;; Construct a table where one of the functions intentionally contains an `unreachable` instruction, then use `call_indirect` to call this function. Ensure the execution hits the `unreachable` path precisely due to the function being successfully indexed and called.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (table funcref (elem $unreachable))
    (func $valid_function (result i32)
      (i32.const 10)
    )
    (func $unreachable (unreachable))
    (func
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type mismatch"
)