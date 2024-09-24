;; 3. Construct a `call_indirect` that uses a negative index for `br_table`, ensuring the error handling mechanism is tested for correct trapping behavior.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $negative-index
      (call_indirect (type 0) (i32.const -1))
    )
  )
  "out of bounds table index"
)