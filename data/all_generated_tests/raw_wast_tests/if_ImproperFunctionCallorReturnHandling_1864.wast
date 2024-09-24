;; A test where an `if` instruction encloses a function call (`call_indirect`) that uses an invalid type index in the type table, ensuring error traps are correctly triggered and control flow is properly diverted to handle the errors.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then (call_indirect (type 1) (i32.const 0) (i32.const 2)))
        (else (i32.const 0))
      )
    )
  )
  "unknown type"
)