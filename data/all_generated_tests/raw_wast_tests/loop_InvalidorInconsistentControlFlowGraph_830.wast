;; 1. Create a loop with an invalid block type that should not conform to any function type, challenging the type checking implementation. This will test if the incorrect type detection is handled properly and consistently.

(assert_invalid
  (module
    (func (loop (type i32)))
  )
  "invalid block type"
)