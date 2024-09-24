;; 7. **Test 7**: Formulate a sequence of nested loops where a `call` within the innermost loop returns types intermittently popped by breaks (`br`) to various loop depths. Verify if nested loop handling correctly pop and push types according to call results.

(assert_invalid
  (module
    (func $f (result i32))
    (type $sig (func (result i32)))
    (table funcref (elem $f))
    (func $nested-loop-call
      (loop $outer
        (loop $inner
          (br $outer (call $f))
          (call $f)
          (br $inner)
        )
      )
    )
  )
  "type mismatch"
)