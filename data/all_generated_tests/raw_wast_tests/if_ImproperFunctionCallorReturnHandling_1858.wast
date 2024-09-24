;; 9. A test where the `then` block of an `if` instruction contains an indirect function call (`call_indirect`) using a table with an incorrect element type, while the `else` block contains a `br` (branch). This checks if indirect function table checks lead to correct evaluation changes.

(assert_invalid
  (module
    (type $functype (func (result i32)))
    (table $table 1 funcref)
    (func $invalid-call
      (if (result i32) (i32.const 1)
        (then
          (call_indirect (type $functype) (i32.const 0) (i32.const 0))
        )
        (else
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)