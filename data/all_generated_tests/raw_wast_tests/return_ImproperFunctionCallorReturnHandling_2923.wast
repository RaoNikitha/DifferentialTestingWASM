;; 2. Create a function that executes a `call_indirect` instruction directing to an invalid or inappropriate function type. The expected outcome should be a trap, distinguishing improper handling of indirect calls.

(assert_invalid
  (module
    (table 1 funcref)
    (type $t_invalid (func (result i32)))
    (func $type-use-none)
    (func (result i32)
      (call_indirect (type $t_invalid) (return))
    )
  )
  "type mismatch"
)