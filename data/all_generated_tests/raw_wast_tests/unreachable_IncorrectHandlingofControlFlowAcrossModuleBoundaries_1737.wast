;; 8. **Test Description:**    Write a function that exports another function with an `unreachable` instruction within a block that is activated via a table of functions. Ensure calling this exported function from another module causes an immediate trap in both implementations.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $unreachable_func)
    (func $unreachable_func
      (block
        (unreachable)
      )
    )
    (func (export "test")
      (call_indirect (type (func)) (i32.const 0))
    )
  )
  "type mismatch"
)